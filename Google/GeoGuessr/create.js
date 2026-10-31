var map = null;
var panorama = null;
var streetViewService = null;
var currentMarker = null;
var searchMarker = null;
var placeAutocomplete = null;
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
            zoom: 3,
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

    initMapSearch();
    positionChanged();
}

function initMapSearch() {
    var placeAutocomplete;
    var card = $('#mapSearch');

    if (
        !card.length ||
        !google.maps.places ||
        !google.maps.places.PlaceAutocompleteElement
    ) {
        return;
    }

    placeAutocomplete = new google.maps.places.PlaceAutocompleteElement();
    placeAutocomplete.placeholder = 'Search Google Maps';
    placeAutocomplete.value = card.attr('data-qname') || '';
    card.append(placeAutocomplete);
    placeAutocomplete.addEventListener('gmp-select', mapSearchSelected);
    searchForQuery(placeAutocomplete.value);
}

function searchForQuery(query) {
    if (
        !query ||
        !google.maps.places.AutocompleteSuggestion
    ) {
        return;
    }

    google.maps.places.AutocompleteSuggestion
        .fetchAutocompleteSuggestions({ input: query })
        .then(searchSuggestions)
        .catch(mapSearchFailed);
}

function searchSuggestions(response) {
    var prediction;

    if (!response.suggestions || !response.suggestions.length) {
        showMessage('No location found for that search.', 'warning');
        return;
    }

    prediction = response.suggestions[0].placePrediction;

    if (!prediction) {
        showMessage('No location found for that search.', 'warning');
        return;
    }

    if (placeAutocomplete && prediction.text) {
        placeAutocomplete.value = prediction.text.toString();
    }

    choosePlacePrediction(prediction);
}

function mapSearchSelected(event) {
    if (!event.placePrediction) {
        return;
    }

    choosePlacePrediction(event.placePrediction);
}

function choosePlacePrediction(prediction) {
    var place = prediction.toPlace();

    place.fetchFields({
        fields: ['location', 'viewport']
    }).then(mapSearchFetched).catch(mapSearchFailed);

    function mapSearchFetched() {
        mapSearchPlace(place);
    }
}

function mapSearchPlace(place) {
    if (!place.location) {
        showMessage('No location found for that search.', 'warning');
        return;
    }

    if (place.viewport) {
        map.fitBounds(place.viewport);
    } else {
        map.setCenter(place.location);
        map.setZoom(16);
    }

    showSearchMarker(place.location);
    showMessage('Click the pin to choose this location.', 'info');
}

function showSearchMarker(location) {
    if (!searchMarker) {
        searchMarker = new google.maps.Marker({
            position: location,
            map: map,
            title: 'Click to choose this location',
            zIndex: 1000
        });
        searchMarker.addListener('click', searchMarkerClicked);
        return;
    }

    searchMarker.setPosition(location);
    searchMarker.setMap(map);
}

function searchMarkerClicked() {
    showStreetView(searchMarker.getPosition(), 1000);
}

function mapSearchFailed() {
    showMessage('That search could not be completed.', 'warning');
}

function mapClicked(event) {
    showStreetView(event.latLng, 100);
}

function showStreetView(location, radius) {
    requestNumber++;

    var thisRequest = requestNumber;

    showMessage('Searching for Street View...', 'info');

    streetViewService.getPanorama(
        {
            location: location,
            radius: radius,
            preference:
                google.maps.StreetViewPreference.NEAREST,
            sources: [
                google.maps.StreetViewSource.OUTDOOR
            ]
        },
        panoramaFound
    );

    function panoramaFound(data, status) {
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
            return;
        }

        showMessage(
            'No Street View found near that point. ' +
            'Try another road.',
            'warning'
        );
    }
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
