async function initMap() {

    let hickory = { lat: 35.74115, lng: -81.38955 };
    $('#airports tr').each(findHickory);
    function findHickory() {
        var cells = $(this).find('td');
        if (cells.eq(0).text() !== 'HKY') {
            return;
        }
        hickory = {
            lat: parseFloat(cells.eq(2).text()),
            lng: parseFloat(cells.eq(3).text())
        };
    }

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    await google.maps.importLibrary("geometry");

    const map = new Map(document.getElementById("map"), {

        zoom: 12,
        minZoom: 3,
        center: hickory,
        gestureHandling: "greedy",
        mapId: "7c151be88bb28cf02723aa80",
        restriction: {
            latLngBounds: {
                north: 85,
                south: -78,
                west: -180,
                east: 180
            }
        }

    });

    /* ROUTE LINE */

    const route = new google.maps.Polyline({

        path: [],
        geodesic: true,
        strokeColor: "#00AEEF",
        strokeOpacity: 1,
        strokeWeight: 3,
        map: map

    });

    /* AIRPORT MARKERS */






    $('#airports tr').each(processAirportRow);
    function processAirportRow() {
        var cells = $(this).find('td');

        var code = cells.eq(0).text();
        var name = cells.eq(1).text();
        var lat  = parseFloat(cells.eq(2).text());
        var lng  = parseFloat(cells.eq(3).text());
        var countryName = cells.eq(4).text();
        var countryCode = cells.eq(5).text();
        var stateName = cells.eq(6).text();
        var stateCode = cells.eq(7).text().replace(/^\s+|\s+$/g, '');

        createAirport(code, name, lat, lng, countryName, countryCode, stateName, stateCode);
    }
function createAirport(label, title, lat, lng, countryName, countryCode, stateName, stateCode) {

    const pos = {
        lat: lat,
        lng: lng
    };

    const el = document.createElement("div");
    el.className = "airport-marker";

    const img = document.createElement("img");
    img.src = flagSrc(countryCode, stateCode);
    img.width = 24;
    img.alt = stateCode ? stateName : countryName;
    if (stateCode) {
        $(img).one('error', flag_missing);
    }
    function flag_missing(response) {
        this.src = 'https://flagcdn.com/w40/' + stateCode.toLowerCase() + '.png';
        return response;
    }

    el.appendChild(img);

    var marker = new AdvancedMarkerElement({
        map: map,
        position: pos,
        content: el,
        title: title + " (" + label + ")",
        zIndex: 1,
        gmpClickable: true
    });

    marker.addListener('click', clickAirport);
    function clickAirport(response) {
        return flyTo(pos, label);
    }
    return marker;

}










//      createAirport("CAI", cairo);
//      createAirport("IAD", dulles);

    /* AIRPLANE */

    const planeEl = document.createElement("div");
    planeEl.style.fontSize = "24px";
    planeEl.textContent = "✈️";
    planeEl.className = "airplane";

    const plane = new AdvancedMarkerElement({
        map: map,
        position: hickory,
        content: planeEl,
        zIndex: 1000,
        anchorLeft: "-50%",
        anchorTop: "-50%"
    });

    /* GREAT CIRCLE ANIMATION */

    let start = new google.maps.LatLng(hickory);
    let end = new google.maps.LatLng(hickory);

    const duration = 30; // seconds

    let startTime = null;
    let flying = false;
    let departed = 'HKY';
    let destinationCode = '';

    $('#speed').text('0');

    function showSpeed() {
        var distanceMeters = google.maps.geometry.spherical.computeDistanceBetween(start, end);
        var speedMph = distanceMeters / duration * 2.23694;
        $('#speed').text(Math.round(speedMph).toLocaleString());
        return speedMph;
    }

    function flyTo(destination, code) {
        start = new google.maps.LatLng(plane.position);
        end = new google.maps.LatLng(destination);
        route.setPath([start, end]);
        destinationCode = code;
        $('#flight').text(departed + ' \u2192 ' + code);
        startTime = null;
        var distanceMeters = google.maps.geometry.spherical.computeDistanceBetween(start, end);
        if (distanceMeters < 1000) {
            plane.position = end;
            planeEl.style.transform = 'rotate(0deg)';
            flying = false;
            $('#speed').text('0');
            return destination;
        }
        showSpeed();
        if (!flying) {
            flying = true;
            requestAnimationFrame(animatePlane);
        }
        return destination;
    }

    function animatePlane(timestamp) {

        if (!startTime) startTime = timestamp;

        const elapsed = (timestamp - startTime) / 1000;

        const fraction = Math.min(elapsed / duration, 1);

        const position =
            google.maps.geometry.spherical.interpolate(start, end, fraction);

        plane.position = position;

        /* compute heading slightly ahead of current position */

        const nextFraction = Math.min(fraction + 0.001, 1);

        const nextPosition =
            google.maps.geometry.spherical.interpolate(start, end, nextFraction);

        const heading =
            google.maps.geometry.spherical.computeHeading(position, nextPosition);

        /* correction because airplane emoji isn't aligned with north */

        planeEl.style.transform = `rotate(${heading - 40}deg)`;
        if (fraction < 1) {

            requestAnimationFrame(animatePlane);

        } else {

            /* snap perfectly onto the airport */

            plane.position = end;

            planeEl.style.transform = "rotate(0deg)";
            flying = false;
            departed = destinationCode;
        }
    }

}

$(initMap);

function flagSrc(countryCode, stateCode) {
    if (stateCode) {
        return 'https://flagcdn.com/w40/us-' + stateCode.toLowerCase() + '.png';
    }
    return countryCode_twemoji(countryCode.toUpperCase());
}

function countryCode_twemoji(code) {
	var arr = []
	for (var i = 0; i < code.length; i++) {
		arr.push((code.charCodeAt(i) - 0x41 + 0x1F1E6).toString(16))
	}
	return 'https://twemoji.maxcdn.com/v/latest/72x72/' + arr.join('-') + '.png'
}
