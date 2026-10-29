var map = null;
var panorama = null;
var guessMarker = null;
var guessPosition = null;
var saving = false;
var panoramaFallbackUsed = false;

var startLocation = {
    lat: 20,
    lng: 0
};

function initMap() {
    map = new google.maps.Map(
        document.getElementById('map'),
        {
            center: startLocation,
            zoom: 2,
            minZoom: 2,
            mapTypeId: 'roadmap',
            gestureHandling: 'greedy',
            streetViewControl: false,
            fullscreenControl: true,
            mapTypeControl: true
        }
    );

    panorama = new google.maps.StreetViewPanorama(
        document.getElementById('streetview'),
        {
            position: {
                lat: spot.lat,
                lng: spot.lng
            },
            pov: {
                heading: spot.heading,
                pitch: spot.pitch
            },
            zoom: spot.zoom,
            clickToGo: true,
            linksControl: false,
            addressControl: false,
            showRoadLabels: false,
            fullscreenControl: true,
            enableCloseButton: false,
            visible: true
        }
    );

    panorama.addListener(
        'status_changed',
        statusChanged
    );

    if (spot.panoid) {
        panorama.setPano(spot.panoid);
    }

    map.addListener('click', mapClicked);

    document.getElementById('hereButton')
        .addEventListener('click', here);

    if (alreadySubmitted) {
        lockGame();
    }
}

function statusChanged() {
    if (!panorama) {
        return;
    }

    var status = panorama.getStatus();

    if (status === google.maps.StreetViewStatus.OK) {
        return;
    }

    // A saved panorama ID may no longer be valid.
    // Try the saved geographic position instead.
    if (spot.panoid && !panoramaFallbackUsed) {
        panoramaFallbackUsed = true;

        panorama.setPosition({
            lat: spot.lat,
            lng: spot.lng
        });

        panorama.setPov({
            heading: spot.heading,
            pitch: spot.pitch
        });

        panorama.setZoom(spot.zoom);
        return;
    }

    showMessage(
        'Street View is unavailable for this location.',
        'warning'
    );
}

function mapClicked(event) {
    if (saving || alreadySubmitted) {
        return;
    }

    guessPosition = event.latLng;

    if (!guessMarker) {
        guessMarker = new google.maps.Marker({
            position: guessPosition,
            map: map,
            draggable: true,
            title: 'Your guess'
        });

        guessMarker.addListener(
            'dragend',
            markerDragged
        );
    } else {
        guessMarker.setPosition(guessPosition);
    }

    updateGuess();
}

function markerDragged(event) {
    guessPosition = event.latLng;
    updateGuess();
}

function updateGuess() {
    if (!guessPosition) {
        return;
    }

    document.getElementById('coordinates').textContent =
        'Latitude: ' + guessPosition.lat().toFixed(6) +
        '   Longitude: ' + guessPosition.lng().toFixed(6);

    document.getElementById('hereButton').disabled = false;

    showMessage('', '');
}

function here() {
    if (saving || alreadySubmitted) {
        return;
    }

    if (!guessPosition) {
        showMessage(
            'Click the map to place your guess.',
            'warning'
        );
        return;
    }

    document.getElementById('guessLat').value =
        guessPosition.lat();

    document.getElementById('guessLng').value =
        guessPosition.lng();

    saving = true;

    document.getElementById('hereButton').disabled = true;

    document.getElementById('location').submit();
}

function lockGame() {
    map.setOptions({
        draggableCursor: 'default'
    });

    document.getElementById('hereButton').disabled = true;

    document.getElementById('coordinates').textContent =
        'Guess submitted.';

    showMessage(
        'Your guess has been recorded.',
        'success'
    );
}

function showMessage(message, type) {
    var element = document.getElementById('message');

    element.textContent = message;
    element.className = '';

    if (message && type) {
        element.className = 'alert alert-' + type;
    }
}

function googleMapsError() {
    showMessage(
        'Google Maps could not be loaded. Check your API key.',
        'danger'
    );
}
