var map = null;
var bounds = null;

function initMap() {
    bounds = new google.maps.LatLngBounds();

    map = new google.maps.Map($('#map')[0], {
        center: {
            lat: spot.lat,
            lng: spot.lng
        },
        zoom: 4,
        gestureHandling: 'greedy',
        streetViewControl: false,
        fullscreenControl: true,
        mapTypeControl: true
    });

    addSpot();

    for (var i = 0; i < guesses.length; i++) {
        addGuess(guesses[i]);
    }

    if (guesses.length) {
        map.fitBounds(bounds);
    }
}

function addSpot() {
    var position = {
        lat: spot.lat,
        lng: spot.lng
    };

    bounds.extend(position);

    new google.maps.Marker({
        position: position,
        map: map,
        title: spot.name
    });
}

function addGuess(guess) {
    var position = {
        lat: guess.lat,
        lng: guess.lng
    };

    bounds.extend(position);

    new google.maps.Marker({
        position: position,
        map: map,
        title: guess.name
    });

    new google.maps.Polyline({
        path: [
            position,
            {
                lat: spot.lat,
                lng: spot.lng
            }
        ],
        geodesic: true,
        strokeColor: '#00AEEF',
        strokeOpacity: 1,
        strokeWeight: 3,
        map: map
    });
}

function googleMapsError() {
    $('#map').text('Google Maps could not be loaded. Check your API key.');
}
