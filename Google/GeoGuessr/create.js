var map = null;
var panorama = null;
var streetViewService = null;
var currentMarker = null;
var requestNumber = 0;
var saving = false;

var startLocation = {
    lat: 35.7400,
    lng: -81.3300
};

function initMap() {
    streetViewService = new google.maps.StreetViewService();

    map = new google.maps.Map(
        document.getElementById('map'),
        {
            center: startLocation,
            zoom: 15,
            mapTypeId: 'roadmap',
            gestureHandling: 'greedy',
            streetViewControl: true,
            fullscreenControl: true,
            mapTypeControl: true
        }
    );

    panorama = new google.maps.StreetViewPanorama(
        document.getElementById('streetview'),
        {
            position: startLocation,
            pov: {
                heading: 0,
                pitch: 0
            },
            zoom: 1,
            clickToGo: true,
            linksControl: false,
            addressControl: true,
            showRoadLabels: true,
            fullscreenControl: true,
            enableCloseButton: false,
            visible: true
        }
    );

    // Show the same Street View in the map's Pegman.
    map.setStreetView(panorama);

    // Clicking the map selects a Street View position.
    map.addListener('click', mapClicked);

    // Track the student's position as they walk.
    panorama.addListener(
        'position_changed',
        positionChanged
    );

    panorama.addListener(
        'status_changed',
        statusChanged
    );

    document.getElementById('hereButton')
        .addEventListener('click', here);

    positionChanged();
}

function mapClicked(event) {
    var clickedLocation = event.latLng;

    requestNumber++;

    var thisRequest = requestNumber;

    showMessage('Searching for Street View...', 'info');

    streetViewService.getPanorama(
        {
            location: clickedLocation,
            radius: 100,
            preference:
                google.maps.StreetViewPreference.NEAREST,
            sources: [
                google.maps.StreetViewSource.OUTDOOR
            ]
        },
        function(data, status) {
            if (thisRequest !== requestNumber) {
                return;
            }

            if (
                status === google.maps.StreetViewStatus.OK &&
                data &&
                data.location &&
                data.location.pano
            ) {
                panorama.setPano(data.location.pano);
                panorama.setPov({
                    heading: 0,
                    pitch: 0
                });

                panorama.setVisible(true);
                showMessage('', '');
            } else {
                showMessage(
                    'No Street View found near that point. ' +
                    'Try another road.',
                    'warning'
                );
            }
        }
    );
}

function positionChanged() {
    if (!panorama) {
        return;
    }

    var position = panorama.getPosition();

    if (!position) {
        return;
    }

    if (!currentMarker) {
        currentMarker = new google.maps.Marker({
            position: position,
            map: map,
            title: 'Current Street View position'
        });
    } else {
        currentMarker.setPosition(position);
    }

    document.getElementById('coordinates').textContent =
        'Latitude: ' + position.lat().toFixed(6) +
        '   Longitude: ' + position.lng().toFixed(6);

    document.getElementById('hereButton').disabled = false;
}

function statusChanged() {
    var status = panorama.getStatus();

    if (status === google.maps.StreetViewStatus.OK) {
        positionChanged();
        return;
    }

    document.getElementById('hereButton').disabled = true;

    showMessage(
        'Street View is unavailable at this location.',
        'warning'
    );
}

function here() {
    if (saving) {
        return;
    }

    if (
        !panorama ||
        panorama.getStatus() !==
            google.maps.StreetViewStatus.OK
    ) {
        showMessage(
            'Choose a valid Street View location.',
            'warning'
        );
        return;
    }

    var position = panorama.getPosition();
    var pov = panorama.getPov();

    if (!position) {
        showMessage(
            'Street View position is not available.',
            'warning'
        );
        return;
    }

    var locationName =
        document.getElementById('locationName')
            .value.trim();

    if (!locationName) {
        showMessage(
            'Please name your location.',
            'warning'
        );
        document.getElementById('locationName').focus();
        return;
    }

    var location = {
        name: locationName,
        lat: position.lat(),
        lng: position.lng(),
        heading: pov.heading,
        pitch: pov.pitch,
        zoom: panorama.getZoom(),
        panoid: panorama.getPano()
    };

    saveLocation(location);
}

function saveLocation(location) {
    var form = $('#location');
    var fieldName;

    saving = true;

    for (fieldName in location) {
        form.find('[name=' + fieldName + ']').val(location[fieldName]);
    }

    form.hide().detach();
    $('main').empty();
    form.appendTo(document.body);
    form.trigger('submit');
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
