async function initMap() {

    const cairo = { lat: 30.1219, lng: 31.4056 };
    const dulles = { lat: 38.9531, lng: -77.4565 };

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    await google.maps.importLibrary("geometry");

    const map = new Map(document.getElementById("map"), {

        zoom: 3,
        center: { lat: 40, lng: -20 },
        mapId: "7c151be88bb28cf02723aa80"

    });

    /* ROUTE LINE */

    const route = new google.maps.Polyline({

        path: [cairo, dulles],
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

        createAirport(code, name, lat, lng, countryName, countryCode);
    }
function createAirport(label, title, lat, lng, countryName, countryCode) {

    const pos = {
        lat: lat,
        lng: lng
    };

    const el = document.createElement("div");
    el.className = "airport-marker";

    const img = document.createElement("img");
    img.src = countryCode_twemoji(countryCode.toUpperCase());
    img.width = 24;
    img.height = 24;
    img.alt = countryName;

    el.appendChild(img);

    return new AdvancedMarkerElement({
        map: map,
        position: pos,
        content: el,
        title: title + " (" + label + ")"
    });

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
        position: cairo,
        content: planeEl
    });

    /* GREAT CIRCLE ANIMATION */

    const start = new google.maps.LatLng(cairo);
    const end = new google.maps.LatLng(dulles);
    //const start=new google.maps.LatLng(dulles);
    //const end=new google.maps.LatLng(cairo);

    const duration = 30; // seconds

    const distanceMeters =
        google.maps.geometry.spherical.computeDistanceBetween(start, end);

    const speedMps = distanceMeters / duration;

    const speedMph = speedMps * 2.23694;

    $('#speed').text(Math.round(speedMph).toLocaleString())

    let startTime = null;

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

        planeEl.style.transform = `rotate(${heading - 40}deg) translateY(-20px)`;
        if (fraction < 1) {

            requestAnimationFrame(animatePlane);

        } else {

            /* snap perfectly onto the airport */

            plane.position = end;

            planeEl.style.transform = "rotate(0deg)";
        }
    }

    requestAnimationFrame(animatePlane);

}

$(initMap);

$("#toggleSidebar").on("click", function () {
    $("#sidebar").toggleClass("open");
});

function countryCode_twemoji(code) {
	var arr = []
	for (var i = 0; i < code.length; i++) {
		arr.push((code.charCodeAt(i) - 0x41 + 0x1F1E6).toString(16))
	}
	return 'https://twemoji.maxcdn.com/v/latest/72x72/' + arr.join('-') + '.png'
}
