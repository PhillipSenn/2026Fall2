var artifacts = [];
var currentIndex = 0;

function showArtifact() {
    var title = document.getElementById('artifactTitle');
    var image = document.getElementById('artifactImage');
    var details = document.getElementById('artifactDetails');
    var link = document.getElementById('artifactLink');
    var counter = document.getElementById('counter');
    var previous = document.getElementById('previous');
    var next = document.getElementById('next');

    if (!artifacts.length) {
        title.textContent = 'No artifacts available';
        image.hidden = true;
        link.hidden = true;
        counter.textContent = '0 of 0';
        previous.disabled = true;
        next.disabled = true;
        return;
    }

    var artifact = artifacts[currentIndex];

    var sourceTitle = artifact.querySelector('.artifact-title');
    var sourceImage = artifact.querySelector('.artifact-image');
    var sourceDetails = artifact.querySelector('.artifact-details');
    var sourceLink = artifact.querySelector('.artifact-link');

    title.textContent = sourceTitle.textContent.trim();

    image.src = sourceImage.src;
    image.alt = sourceImage.alt;
    image.hidden = false;

    details.innerHTML = sourceDetails.innerHTML;

    link.href = sourceLink.href;
    link.hidden = false;

    counter.textContent =
        (currentIndex + 1) + ' of ' + artifacts.length;

    previous.disabled = currentIndex === 0;
    next.disabled = currentIndex === artifacts.length - 1;
}

function previousArtifact() {
    if (currentIndex > 0) {
        currentIndex--;
        showArtifact();
    }
}

function nextArtifact() {
    if (currentIndex < artifacts.length - 1) {
        currentIndex++;
        showArtifact();
    }
}

function init() {
    artifacts = Array.prototype.slice.call(
        document.querySelectorAll('#metArtifacts .met-artifact')
    );

    document.getElementById('previous')
        .addEventListener('click', previousArtifact);

    document.getElementById('next')
        .addEventListener('click', nextArtifact);

    showArtifact();
}

init();