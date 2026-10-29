var apod = {
   date: '',
   firstDate: '1995-06-16',
   today: '',
   loading: false
};

function apodInit() {
   document.getElementById('btnPrev').addEventListener('click', apodPrev);
   document.getElementById('btnNext').addEventListener('click', apodNext);
   document.getElementById('btnRandom').addEventListener('click', apodRandom);
   document.getElementById('btnToday').addEventListener('click', apodToday);
   document.getElementById('btnExplanation').addEventListener('mousedown', apodExplanationMouseDown);
   document.getElementById('btnExplanation').addEventListener('click', apodExplanation);
   $('#apodMedia').on('click', '.apod-image', apodZoomImage);
   $('#apodZoom').on('click', apodCloseZoom);

   apod.today = apodFormatDate(new Date());

   apodShowEarned(+$('.progress-bar').attr('aria-valuenow'));
   apodLoad('');
}

function apodFormatDate(date) {
   var year = date.getFullYear();
   var month = String(date.getMonth() + 1).padStart(2, '0');
   var day = String(date.getDate()).padStart(2, '0');

   return year + '-' + month + '-' + day;
}

function apodAddDays(dateString, days) {
   var parts = dateString.split('-');

   var date = new Date(
      Number(parts[0]),
      Number(parts[1]) - 1,
      Number(parts[2])
   );

   date.setDate(date.getDate() + days);

   return apodFormatDate(date);
}

function apodSetLoading(loading) {
   apod.loading = loading;

   document.getElementById('btnPrev').disabled =
      loading || apod.date <= apod.firstDate;

   document.getElementById('btnNext').disabled =
      loading || apod.date >= apod.today;

   document.getElementById('btnRandom').disabled = loading;
   document.getElementById('btnToday').disabled = loading;

   if (loading) {
      $('.card-header:first').text('Loading astronomy picture...');
   }
}

function apodLoad(date, random) {
   if (apod.loading) {
      return;
   }

   var url = 'apod.cfm';

   if (random) {
      url += '?random=1';
   } else if (date) {
      url += '?date=' + encodeURIComponent(date);
   }

   apodSetLoading(true);

   fetch(url)
      .then(apodCheckResponse)
      .then(apodParseJSON)
      .then(apodDisplay)
      .catch(apodError);
}

function apodCheckResponse(response) {
   if (!response.ok) {
      throw new Error('NASA request failed: HTTP ' + response.status);
   }

   return response;
}

function apodParseJSON(response) {
   return response.json();
}

function apodDisplay(data) {
   if (data.error) {
      throw new Error(data.message || 'NASA returned an error.');
   }

   apod.date = data.date;

   document.getElementById('explanationPanel').open = false;

   apodShowTitle(data);

   document.getElementById('apodDate').textContent =
      apodDisplayDate(data.date);

   apodDisplayMedia(data);
   apodDisplayExplanation(data);
   apodDisplayCredit(data);
   apodDisplayRateLimit(data);

   apodSetLoading(false);
}

function apodShowTitle(data) {
   var link = $('<a>', {
      id: 'apodTitle',
      href: apodSafeURL(data.permalink || data.url) ||
         'https://science.nasa.gov/',
      target: '_blank',
      rel: 'noopener noreferrer',
      text: data.title || ''
   });

   $('.card-header:first').empty().append(link);
}

function apodDisplayDate(dateString) {
   var parts = dateString.split('-');

   var date = new Date(
      Number(parts[0]),
      Number(parts[1]) - 1,
      Number(parts[2])
   );

   return date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
   });
}

function apodSafeURL(url) {
   if (!url || typeof url !== 'string') {
      return '';
   }

   try {
      var parsed = new URL(url);

      if (parsed.protocol === 'https:') {
         return parsed.href;
      }
   } catch (e) {
      return '';
   }

   return '';
}

function apodDisplayMedia(data) {
   var container = document.getElementById('apodMedia');

   apodClearMedia(container);

   if (data.media_type === 'image' && data.hdurl) {
      var img = document.createElement('img');

      img.src = apodSafeURL(data.hdurl);
      img.alt = data.alt || data.title || 'Astronomy picture';
      img.className = 'apod-image';
      img.loading = 'eager';

      container.insertBefore(img, document.getElementById('apodCredit'));

      return;
   }

   if (apodDisplayEmbed(container, data)) {
      return;
   }

   apodDisplayVideo(container, data);
}

function apodZoomImage() {
   var image = $('#apodZoomImage');

   $('#apodZoom').prop('hidden', false);
   image.off('load').one('load', apodCenterZoom);
   image.attr('alt', this.alt);
   image.attr('src', this.src);
}

function apodCenterZoom() {
   var zoom = document.getElementById('apodZoom');

   zoom.scrollLeft = (zoom.scrollWidth - zoom.clientWidth) / 2;
   zoom.scrollTop = (zoom.scrollHeight - zoom.clientHeight) / 2;
}

function apodCloseZoom() {
   $('#apodZoom').prop('hidden', true);
   $('#apodZoomImage').attr('src', '');
}

function apodDisplayVideo(container, data) {
   var video = document.createElement('video');
   var src = apodVideoURL(data);

   video.className = 'apod-video';
   video.controls = true;
   video.preload = 'metadata';
   video.title = data.title || '';

   if (data.hdurl) {
      video.poster = apodSafeURL(data.hdurl);
   }

   if (src) {
      video.src = src;
   }

   container.insertBefore(video, document.getElementById('apodCredit'));
}

function apodClearMedia(container) {
   var child = container.firstChild;

   while (child) {
      var next = child.nextSibling;

      if (child.id !== 'apodCredit') {
         child.remove();
      }

      child = next;
   }
}

function apodDisplayEmbed(container, data) {
   var src = apodEmbedURL(data);
   var frame = document.createElement('iframe');

   if (!src) {
      return false;
   }

   frame.className = 'apod-embed';
   frame.src = src;
   frame.title = data.title || 'Astronomy video';
   frame.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share';
   frame.allowFullscreen = true;
   frame.referrerPolicy = 'strict-origin-when-cross-origin';

   container.insertBefore(frame, document.getElementById('apodCredit'));

   return true;
}

function apodEmbedURL(data) {
   var html = data.basic_html || '';
   var doc = new DOMParser().parseFromString(html, 'text/html');
   var iframe = doc.querySelector('iframe');
   var src = '';

   if (!iframe) {
      return '';
   }

   src = iframe.getAttribute('src') || '';

   if (src.slice(0, 2) === '//') {
      src = 'https:' + src;
   }

   return apodAllowedEmbed(src);
}

function apodAllowedEmbed(url) {
   var parsed = null;
   var host = '';

   if (!url) {
      return '';
   }

   try {
      parsed = new URL(url);
   } catch (e) {
      return '';
   }

   if (parsed.protocol !== 'https:') {
      return '';
   }

   host = parsed.hostname.toLowerCase();

   if (
      host === 'www.youtube.com' ||
      host === 'youtube.com' ||
      host === 'www.youtube-nocookie.com' ||
      host === 'player.vimeo.com' ||
      host === 'nasa.gov' ||
      host.slice(-9) === '.nasa.gov'
   ) {
      return parsed.href;
   }

   return '';
}

function apodVideoURL(data) {
   var html = data.basic_html || '';
   var doc = new DOMParser().parseFromString(html, 'text/html');
   var source = doc.querySelector('source');
   var video = doc.querySelector('video');
   var src = '';

   if (source) {
      src = source.getAttribute('src') || '';
   }

   if (!src && video) {
      src = video.getAttribute('src') || '';
   }

   return apodSafeURL(src);
}

function apodDisplayExplanation(data) {
   var container = document.getElementById('apodExplanation');

   if (data.explanation) {
      container.innerHTML = apodExplanationBody(data.explanation);
      return;
   }

   container.textContent = 'No explanation is available for this entry.';
}

function apodExplanationBody(html) {
   var previous = '';

   while (html !== previous) {
      previous = html;

      html = html.replace(
         /^\s*<(strong|b)>\s*Explanation\s*:?\s*<\/\1>\s*:?\s*/i,
         ''
      );

      html = html.replace(/^\s*Explanation\s*:\s*/i, '');
   }

   html = html.replace(
      /<\/a>(?:&nbsp;|&#160;|\s)+(?=[,.;:!?)\]])/g,
      '</a>'
   );

   return '\t' + html;
}

function apodDisplayRateLimit(data) {
   $('#rateLimit').text(data['X-RateLimit-Remaining']);
}

function apodDisplayCredit(data) {
   var container = document.getElementById('apodCredit');
   var credit = data.credit || '';
   var copyright = data.copyright || '';

   if (copyright.indexOf('<') !== -1 && credit.indexOf('<') === -1) {
      credit = copyright;
   }

   if (!credit) {
      credit = copyright;
   }

   container.innerHTML = credit;
}

function apodPrev() {
   if (apod.date <= apod.firstDate) {
      return;
   }

   apodGrade();
   apodLoad(apodAddDays(apod.date, -1));
}

function apodNext() {
   if (apod.date >= apod.today) {
      return;
   }

   apodGrade();
   apodLoad(apodAddDays(apod.date, 1));
}

function apodRandom() {
   apodGrade();
   apodLoad('', true);
}

function apodGrade() {
   var bar = $('.progress-bar');
   var score = +bar.attr('aria-valuenow') + 1;
   var url = '../../Grade/merge_act.cfm';
   var form = {};

   apodShowEarned(score);
   form.body = new URLSearchParams();
   form.body.set('id', app.id);
   form.body.set('actid', app.actid);
   form.body.set('earned', score);

   fetch(url, form)
      .then(text_done)
      .then(apodShowEarned)
      .catch(caught(url));
}

function apodShowEarned(response) {
   var earned = parseInt(response, 10);
   var bar = $('.progress-bar');
   var track = bar.parent();
   var label = track.children('.progress-score');
   var shown = +bar.attr('aria-valuenow');

   if (isNaN(earned)) {
      return response;
   }

   earned = Math.min(100, earned);

   if (earned < shown) {
      return response;
   }

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

function apodToday() {
   apodLoad('');
}

function apodExplanationMouseDown(event) {
   event.preventDefault();
}

function apodExplanation() {
   var button = document.getElementById('btnExplanation');

   document.getElementById('explanationPanel').open = true;

   if (button) {
      button.blur();
   }

   window.setTimeout(apodScrollPageEnd, 250);
}

function apodScrollPageEnd() {
   var scrolling = document.scrollingElement || document.documentElement;

   scrolling.scrollTop = scrolling.scrollHeight;
}

function apodError(error) {
   apodSetLoading(false);

   $('.card-header:first').text(
      'Unable to load picture: ' + error.message
   );

   console.error(error);
}

apodInit();