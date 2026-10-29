var artifact = {
   rows: [],
   index: -1,
   gradeQueue: Promise.resolve(),
   pendingEarned: 0,
   gradeScores: []
};

function artifactInit() {
   document.getElementById('btnPrev').addEventListener('click', artifactPrev);
   document.getElementById('btnNext').addEventListener('click', artifactNext);
   document.getElementById('btnExplanation').addEventListener('mousedown', artifactExplanationMouseDown);
   document.getElementById('btnExplanation').addEventListener('click', artifactExplanation);
   $('#artifactMedia').on('click', 'img.img-fluid', artifactZoomImage);
   $('#artifactZoom').on('click', artifactCloseZoom);
   artifact.pendingEarned = +$('.progress-bar').attr('aria-valuenow') || 0;
   artifactShowEarned(artifact.pendingEarned);
   artifactLoad();
}

function artifactLoad() {
   artifactSetLoading(true);
   fetch('artifact.cfm')
      .then(artifactCheckResponse)
      .then(artifactParseJSON)
      .then(artifactReceive)
      .catch(artifactError);
}

function artifactCheckResponse(response) {
   if (!response.ok) {
      throw new Error('Smithsonian request failed: HTTP ' + response.status);
   }
   return response;
}

function artifactParseJSON(response) {
   return response.json();
}

function artifactReceive(data) {
   var i;
   var item;

   if (data.error) {
      throw new Error(data.message || 'Smithsonian returned an error.');
   }

   artifact.rows = [];
   for (i = 0; i < data.rows.length; i++) {
      item = artifactNormalize(data.rows[i]);
      if (item.image && item.description) {
         artifact.rows.push(item);
      }
   }

   artifactSetLoading(false);
   if (!artifact.rows.length) {
      throw new Error('No artifacts with images and descriptions were found in this batch. Reload for another set.');
   }

   artifactDisplay(0);
}

function artifactSetLoading(loading) {
   document.getElementById('btnPrev').disabled = loading || artifact.index <= 0;
   document.getElementById('btnNext').disabled =
      loading || artifact.index >= artifact.rows.length - 1;
   if (loading) {
      document.getElementById('artifactTitle').textContent = 'Loading museum artifacts...';
   }
}

function artifactNormalize(row) {
   var content = row.content || {};
   var freetext = content.freetext || {};
   var descriptive = content.descriptiveNonRepeating || {};
   var media = descriptive.online_media || {};
   var mediaList = media.media || [];
   var description = artifactField(freetext.notes, 'Summary') ||
      artifactField(freetext.notes, 'Long Description') ||
      artifactField(freetext.notes, 'Physical Description');
   var image = '';
   var i;
   var item;
   var link = descriptive.guid || descriptive.record_link || '';

   for (i = 0; i < mediaList.length; i++) {
      item = mediaList[i];
      if (item && item.content) {
         image = artifactSafeURL(item.content);
         if (image) {
            break;
         }
      }
   }

   // Some records include a thumbnail even when the media array is empty.
   if (!image && media.thumbnail) {
      image = artifactSafeURL(media.thumbnail);
   }

   return {
      title: row.title || '',
      date: artifactField(freetext.date, 'Date'),
      description: description,
      manufacturer: artifactField(freetext.name, 'Manufacturer'),
      credit: artifactField(freetext.creditLine, 'Credit Line'),
      rights: artifactField(freetext.objectRights, 'Restrictions & Rights'),
      type: artifactField(freetext.objectType, 'Type'),
      image: image,
      link: artifactSafeURL(link)
   };
}

function artifactField(entries, label) {
   var i;
   if (!entries || !entries.length) {
      return '';
   }
   for (i = 0; i < entries.length; i++) {
      if (entries[i].label === label && entries[i].content) {
         return entries[i].content;
      }
   }
   return '';
}

function artifactSafeURL(value) {
   var parsed;
   if (!value || typeof value !== 'string') {
      return '';
   }
   try {
      parsed = new URL(value);
      if (parsed.protocol === 'https:') {
         return parsed.href;
      }
      // Smithsonian object identifiers commonly use an http://n2t.net ARK.
      if (parsed.protocol === 'http:' && parsed.hostname === 'n2t.net') {
         return 'https:' + parsed.href.substring(5);
      }
   } catch (e) {
      return '';
   }
   return '';
}

function artifactDisplay(index) {
   var item;
   var image;
   var media;
   var title;

   if (index < 0 || index >= artifact.rows.length) {
      return;
   }

   artifact.index = index;
   item = artifact.rows[index];
   title = document.getElementById('artifactTitle');
   title.textContent = item.title;
   title.href = item.link || 'https://airandspace.si.edu/';

   media = document.getElementById('artifactMedia');
   $('#artifactMedia img.img-fluid').remove();
   image = document.createElement('img');
   image.className = 'img-fluid';
   image.src = item.image;
   image.alt = item.title;
   image.loading = 'eager';
   media.insertBefore(image, document.getElementById('artifactCredit'));

   document.getElementById('artifactCredit').textContent =
      [item.date, item.credit, item.rights].filter(artifactNonempty).join(' | ');

   artifactExplain(item);
   document.getElementById('explanationPanel').open = false;
   artifactSetLoading(false);

   // Every display counts, including the initial item and revisits.
   artifactGrade();
}

function artifactNonempty(value) {
   return !!value;
}

function artifactExplain(item) {
   var box = document.getElementById('artifactExplanation');
   var heading = document.createElement('p');
   var paragraph = document.createElement('p');

   box.textContent = '';
   if (item.type || item.manufacturer || item.date) {
      heading.textContent = [
         item.type,
         item.manufacturer,
         item.date
      ].filter(artifactNonempty).join(' | ');
      box.appendChild(heading);
   }
   paragraph.textContent = item.description;
   box.appendChild(paragraph);
}

function artifactPrev() {
   artifactDisplay(artifact.index - 1);
}

function artifactNext() {
   artifactDisplay(artifact.index + 1);
}

function artifactZoomImage() {
   var image = $('#artifactZoomImage');
   $('#artifactZoom').prop('hidden', false);
   image.off('load').one('load', artifactCenterZoom);
   image.attr('alt', this.alt);
   image.attr('src', this.src);
}

function artifactCenterZoom() {
   var zoom = document.getElementById('artifactZoom');
   zoom.scrollLeft = (zoom.scrollWidth - zoom.clientWidth) / 2;
   zoom.scrollTop = (zoom.scrollHeight - zoom.clientHeight) / 2;
}

function artifactCloseZoom() {
   $('#artifactZoom').prop('hidden', true);
   $('#artifactZoomImage').attr('src', '');
}

function artifactExplanationMouseDown(event) {
   event.preventDefault();
}

function artifactExplanation() {
   document.getElementById('explanationPanel').open = true;
   document.getElementById('btnExplanation').blur();
   window.setTimeout(artifactScrollPageEnd, 250);
}

function artifactScrollPageEnd() {
   var scrolling = document.scrollingElement || document.documentElement;
   scrolling.scrollTop = scrolling.scrollHeight;
}

// Serialize grade requests to preserve one request per displayed artifact.
// The server endpoint should increment atomically to handle other tabs too.
function artifactGrade() {
   artifact.pendingEarned = Math.min(100, artifact.pendingEarned + 1);
   artifact.gradeScores.push(artifact.pendingEarned);
   artifact.gradeQueue = artifact.gradeQueue.then(artifactSendNextGrade, artifactSendNextGrade);
}

function artifactSendNextGrade() {
   return artifactSendGrade(artifact.gradeScores.shift());
}

function artifactSendGrade(score) {
   var url = '../../Grade/merge_act.cfm';
   var options = { method: 'POST', body: new URLSearchParams() };

   options.body.set('id', app.id);
   options.body.set('actid', app.actid);
   options.body.set('earned', score);

   return fetch(url, options)
      .then(artifactGradeResponse)
      .then(artifactGradeText)
      .then(artifactShowEarned)
      .catch(artifactGradeError);
}

function artifactGradeResponse(response) {
   if (!response.ok) {
      throw new Error('Grade request failed: HTTP ' + response.status);
   }
   return response;
}

function artifactGradeText(response) {
   return response.text();
}

function artifactGradeError(error) {
   console.error(error);
}

function artifactShowEarned(response) {
   var earned = parseInt(response, 10);
   var bar = $('.progress-bar');
   var track = bar.parent();
   var label = track.children('.progress-score');
   var shown = +bar.attr('aria-valuenow');

   if (isNaN(earned) || earned < shown) {
      return response;
   }
   earned = Math.min(100, earned);
   if (!label.length) {
      label = $('<div class="progress-score">');
      track.append(label);
   }
   bar.css('width', earned + '%')
      .attr('aria-valuenow', earned)
      .text('');
   label.text(earned ? earned + '%' : '');
   if (earned >= 100) {
      bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold');
   }
   return response;
}

function artifactError(error) {
   artifactSetLoading(false);
   document.getElementById('artifactTitle').textContent = error.message;
   console.error(error);
}

artifactInit();
