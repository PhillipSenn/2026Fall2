
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

        function createAirport(label, pos) {

            const el = document.createElement("div");
            el.className = "airport-marker";
            el.textContent = label;

            return new AdvancedMarkerElement({
                map: map,
                position: pos,
                content: el
            });

        }

        createAirport("CAI", cairo);
        createAirport("IAD", dulles);

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
