async function initMap() {

    const cairo = { lat: 30.1219, lng: 31.4056 };
    const dulles = { lat: 38.9531, lng: -77.4565 };

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    await google.maps.importLibrary("geometry");

    const map = new Map(document.getElementById("map"), {
        zoom: 3,
        center: { lat: 40, lng: -20 },
        mapId: "7c151be88bb28cf02723aa80",
        gestureHandling: "greedy"
    });

    /* ---------------------------
       PLANE
    ----------------------------*/

    const planeEl = document.createElement("div");
    planeEl.className = "plane";
    planeEl.textContent = "✈";

const plane = new AdvancedMarkerElement({
    map,
    position: cairo,
    content: planeEl,
    zIndex: 1000
});

    let planePosition = cairo;
    let isFlying = false;

    /* ---------------------------
       ROUTE
    ----------------------------*/

    const routeLine = new google.maps.Polyline({
        map,
        geodesic: true,
        strokeColor: "#00AEEF",
        strokeOpacity: 1,
        strokeWeight: 3
    });

    /* ---------------------------
       CONTRAIL
    ----------------------------*/

    const trail = new google.maps.Polyline({
        map,
        geodesic: true,
        strokeColor: "#ffffff",
        strokeOpacity: 0.5,
        strokeWeight: 2
    });

    let trailPath = [];

    /* ---------------------------
       FLIGHT ANIMATION
    ----------------------------*/

    function flyTo(destination) {

        if (isFlying) return;

        isFlying = true;

        routeLine.setPath([planePosition, destination]);
        trailPath = [];

        const start = new google.maps.LatLng(planePosition);
        const end = new google.maps.LatLng(destination);

        const duration = 20000;

        let startTime = null;

        function animate(timestamp) {

            if (!startTime) startTime = timestamp;

            const elapsed = timestamp - startTime;
const fraction = Math.min(elapsed / duration, 1);
            const position =
                google.maps.geometry.spherical.interpolate(start, end, fraction);

            plane.position = position;

            /* heading */

            const nextFraction = Math.min(fraction + 0.001, 1);

            const nextPosition =
                google.maps.geometry.spherical.interpolate(start, end, nextFraction);

            const heading =
                google.maps.geometry.spherical.computeHeading(position, nextPosition);

//            planeEl.style.transform =
//                `rotate(${heading - 45}deg) translateY(-12px)`;
            planeEl.style.transform =
                `rotate(${heading - 40}deg) translateY(-20px)`;
//planeEl.innerHTML = `
//<svg width="28" height="28" viewBox="0 0 24 24">
//<path d="M2 16l20-4-20-4v3l14 1-14 1z" fill="white"/>
//</svg>
//`;
/* contrail */

            trailPath.push(position);
            trail.setPath(trailPath);

            if (fraction < 1) {

                requestAnimationFrame(animate);

            } else {

                planePosition = destination;
                isFlying = false;

            }
        }

        requestAnimationFrame(animate);
    }

    /* ---------------------------
       AIRPORT CREATION
    ----------------------------*/

    function createAirport(code, name, lat, lng, countryName, countryCode) {

        const pos = { lat, lng };

        const el = document.createElement("div");
        el.className = "airport-marker";

        const img = document.createElement("img");

        img.src = countryCode_twemoji(countryCode.toUpperCase());
        img.width = 24;
        img.height = 24;

        el.appendChild(img);

        const marker = new AdvancedMarkerElement({
            map,
            position: pos,
            content: el,
            title: `${name} (${code})`
        });

        marker.addListener("click", () => {

            if (isFlying) return;

            flyTo(pos);

        });

        return marker;
    }

    /* ---------------------------
       LOAD AIRPORTS FROM TABLE
    ----------------------------*/

    $('#airports tr').each(function () {

        const cells = $(this).find('td');

        createAirport(
            cells.eq(0).text(),
            cells.eq(1).text(),
            parseFloat(cells.eq(2).text()),
            parseFloat(cells.eq(3).text()),
            cells.eq(4).text(),
            cells.eq(5).text()
        );

    });

}

initMap()