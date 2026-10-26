async function initMap() {

    let hickory = { lat: 35.74115, lng: -81.38955, name: 'Hickory Regional', country: '' };
    $('#airports tr').each(findHickory);
    function findHickory() {
        var cells = $(this).find('td');
        if (cells.eq(0).text() !== 'HKY') {
            return;
        }
        hickory = {
            lat: parseFloat(cells.eq(2).text()),
            lng: parseFloat(cells.eq(3).text()),
            name: cells.eq(1).text().replace(/^\s+|\s+$/g, ''),
            country: cells.eq(4).text().replace(/^\s+|\s+$/g, '')
        };
        if (!hickory.country) {
            hickory.country = cells.eq(6).text().replace(/^\s+|\s+$/g, '');
        }
    }

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    await google.maps.importLibrary("geometry");

    const map = new Map(document.getElementById("map"), {

        zoom: 3.6,
        minZoom: 3,
        center: { lat: 40, lng: -40 },
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

    function setStartZoom() {
        if (map.get('isFractionalZoomEnabled') !== true) {
            return;
        }
        map.setZoom(3.6);
        google.maps.event.removeListener(startZoomListener);
    }

    var startZoomListener = map.addListener('isfractionalzoomenabled_changed', setStartZoom);
    setStartZoom();

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
        return flyTo(pos, label, title, countryName);
    }
    return marker;

}










//      createAirport("CAI", cairo);
//      createAirport("IAD", dulles);

    /* AIRPLANE */

    const planeEl = document.createElement("div");
    planeEl.style.fontSize = "24px";
    planeEl.textContent = iconFromCodePoint(document.getElementById('usrCodePoint').textContent);
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
    let destinationName = '';
    let destinationCountry = '';
    let flightPostAt = 0;

    $('#speed').text('0');

    function showSpeed() {
        var distanceMeters = google.maps.geometry.spherical.computeDistanceBetween(start, end);
        var speedMph = distanceMeters / duration * 2.23694;
        $('#speed').text(Math.round(speedMph).toLocaleString());
        return speedMph;
    }

    function flyTo(destination, code, name, country) {
        start = new google.maps.LatLng(plane.position);
        end = new google.maps.LatLng(destination);
        route.setPath([start, end]);
        destinationCode = code;
        destinationName = name.replace(/^\s+|\s+$/g, '');
        destinationCountry = country.replace(/^\s+|\s+$/g, '');
        $('#flight').text(departed + ' \u2192 ' + code);
        startTime = null;
        var distanceMeters = google.maps.geometry.spherical.computeDistanceBetween(start, end);
        if (distanceMeters < 1000) {
            plane.position = end;
            planeEl.style.transform = 'rotate(0deg)';
            flying = false;
            $('#speed').text('0');
            postFlight(end.lat(), end.lng(), true);
            return destination;
        }
        showSpeed();
        postFlight(start.lat(), start.lng(), true);
        if (!flying) {
            flying = true;
            requestAnimationFrame(animatePlane);
        }
        return destination;
    }

    function postFlight(latitude, longitude, force) {
        var nowMs = Date.now();
        var form = {};
        if (!force && nowMs - flightPostAt < 1000) {
            return;
        }
        flightPostAt = nowMs;
        form.body = new URLSearchParams();
        form.body.set('id', app.id);
        form.body.set('airportname', destinationName);
        form.body.set('countryname', destinationCountry);
        form.body.set('latitude', latitude);
        form.body.set('longitude', longitude);
        fetch('plane.cfm', form)
            .then(text_done)
            .then(flight_done)
            .catch(caught('plane.cfm'));
    }
    function flight_done(response) {
        console.log(response)
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

            postFlight(position.lat(), position.lng(), false);
            requestAnimationFrame(animatePlane);

        } else {

            /* snap perfectly onto the airport */

            plane.position = end;

            planeEl.style.transform = "rotate(0deg)";
            flying = false;
            departed = destinationCode;
            postFlight(end.lat(), end.lng(), true);
        }
    }

    var otherStudents = {};

    function readFlights() {
        fetch('plane.cfm?id=' + encodeURIComponent(app.id), { method: 'get' })
            .then(text_done)
            .then(readFlightsDone)
            .catch(caught('plane.cfm'));
    }

    function readFlightsDone(response) {
        var flights = response;
        var seen = {};
        var key;
        if (typeof response === 'string') {
            try {
                flights = JSON.parse(response.replace(/^\s+|\s+$/g, ''));
            } catch (ignore) {
                return;
            }
        }
        if (!flights || flightField(flights, 'latitude') !== '') {
            return;
        }
        for (key in flights) {
            if (!Object.prototype.hasOwnProperty.call(flights, key)) {
                continue;
            }
            placeOtherStudent(key, flights[key], seen);
        }
        removeOtherStudents(seen);
        showFlightDrawer(flights);
    }

    function showFlightDrawer(flights) {
        var body = document.getElementById('flightRows');
        var rows = [];
        var key;
        var i;
        body.textContent = '';
        for (key in flights) {
            if (!Object.prototype.hasOwnProperty.call(flights, key)) {
                continue;
            }
            rows.push(flights[key]);
        }
        rows.sort(sortFlights);
        if (!rows.length) {
            body.textContent = 'No flights.';
            return;
        }
        for (i = 0; i < rows.length; i++) {
            body.appendChild(flightRow(rows[i]));
        }
    }

    function sortFlights(a, b) {
        var nameA = String(flightField(a, 'firstname')).toLowerCase();
        var nameB = String(flightField(b, 'firstname')).toLowerCase();
        if (nameA < nameB) {
            return -1;
        }
        if (nameA > nameB) {
            return 1;
        }
        return 0;
    }

    function flightRow(row) {
        var item = document.createElement('div');
        var name = document.createElement('strong');
        var place = document.createElement('div');
        var position = document.createElement('div');
        var airportname = flightField(row, 'airportname');
        var countryname = flightField(row, 'countryname');
        item.className = 'flight-row';
        name.textContent = flightField(row, 'firstname');
        place.textContent = countryname ? airportname + ', ' + countryname : airportname;
        position.textContent = formatCoord(flightField(row, 'latitude')) + ', ' + formatCoord(flightField(row, 'longitude'));
        item.appendChild(name);
        item.appendChild(place);
        item.appendChild(position);
        return item;
    }

    function formatCoord(value) {
        var number = parseFloat(value);
        if (isNaN(number)) {
            return '';
        }
        return String(Math.round(number * 100000) / 100000);
    }

    function placeOtherStudent(key, row, seen) {
        var studentId = String(flightField(row, 'id') || key);
        var firstname = flightField(row, 'firstname');
        var airportname = flightField(row, 'airportname');
        var countryname = flightField(row, 'countryname');
        var latitude = parseFloat(flightField(row, 'latitude'));
        var longitude = parseFloat(flightField(row, 'longitude'));
        var destination = airportname;
        var marker;
        var label;
        if (!row || studentId.toLowerCase() === String(app.id).toLowerCase()) {
            return;
        }
        if (isNaN(latitude) || isNaN(longitude)) {
            return;
        }
        if (countryname) {
            destination = airportname + ', ' + countryname;
        }
        studentId = studentId.toLowerCase();
        seen[studentId] = true;
        marker = otherStudents[studentId];
        if (!marker) {
            label = document.createElement('div');
            label.className = 'student-marker';
            label.appendChild(studentLine('student-plane', iconFromCodePoint(flightField(row, 'codePoint'))));
            label.appendChild(studentTip(firstname, destination));
            marker = new AdvancedMarkerElement({
                map: map,
                position: { lat: latitude, lng: longitude },
                content: label,
                zIndex: 500,
                gmpClickable: true,
                anchorLeft: '-50%',
                anchorTop: '-50%'
            });
            marker.addListener('click', toggleStudentTip);
            function toggleStudentTip(event) {
                var open = label.classList.contains('open');
                if (event && event.domEvent) {
                    event.domEvent.stopPropagation();
                }
                closeStudentTips();
                if (!open) {
                    label.classList.add('open');
                }
            }
            otherStudents[studentId] = marker;
            return;
        }
        marker.content.querySelector('.student-name').textContent = firstname;
        marker.content.querySelector('.student-destination').textContent = destination;
        marker.content.querySelector('.student-plane').textContent = iconFromCodePoint(flightField(row, 'codePoint'));
        glideStudent(studentId, marker, latitude, longitude);
    }

    var studentMoves = {};

    function glideStudent(studentId, marker, latitude, longitude) {
        var end = new google.maps.LatLng(latitude, longitude);
        var start = new google.maps.LatLng(marker.position);
        var distance = google.maps.geometry.spherical.computeDistanceBetween(start, end);
        var move = studentMoves[studentId];
        if (distance < 100) {
            marker.position = end;
            if (move) {
                move.done = true;
            }
            return;
        }
        if (!move) {
            move = { running: false };
            studentMoves[studentId] = move;
        }
        move.marker = marker;
        move.start = start;
        move.end = end;
        move.startTime = null;
        move.done = false;
        if (!move.running) {
            move.running = true;
            requestAnimationFrame(stepStudent);
        }
        function stepStudent(timestamp) {
            var current = studentMoves[studentId];
            var fraction;
            var position;
            var nextPosition;
            var heading;
            var planeIcon;
            if (!current || current.done) {
                if (current) {
                    current.running = false;
                }
                return;
            }
            if (!current.startTime) {
                current.startTime = timestamp;
            }
            fraction = Math.min((timestamp - current.startTime) / 3000, 1);
            position = google.maps.geometry.spherical.interpolate(current.start, current.end, fraction);
            nextPosition = google.maps.geometry.spherical.interpolate(current.start, current.end, Math.min(fraction + 0.001, 1));
            heading = google.maps.geometry.spherical.computeHeading(position, nextPosition);
            current.marker.position = position;
            planeIcon = current.marker.content.querySelector('.student-plane');
            if (planeIcon) {
                planeIcon.style.transform = 'rotate(' + (heading - 40) + 'deg)';
            }
            if (fraction < 1) {
                requestAnimationFrame(stepStudent);
                return;
            }
            current.marker.position = current.end;
            current.running = false;
        }
    }

    function studentTip(firstname, destination) {
        var tip = document.createElement('div');
        tip.className = 'student-tip';
        tip.appendChild(studentLine('student-name', firstname));
        tip.appendChild(studentLine('student-destination', destination));
        return tip;
    }

    function closeStudentTips() {
        var id;
        for (id in otherStudents) {
            if (!Object.prototype.hasOwnProperty.call(otherStudents, id)) {
                continue;
            }
            otherStudents[id].content.classList.remove('open');
        }
    }

    function dismissStudentTip(event) {
        if (event.target.closest && event.target.closest('.student-marker')) {
            return;
        }
        closeStudentTips();
    }

    document.addEventListener('click', dismissStudentTip);
    map.addListener('click', closeStudentTips);

    function studentLine(className, text) {
        var line = document.createElement('div');
        line.className = className;
        line.textContent = text;
        return line;
    }

    function removeOtherStudents(seen) {
        var id;
        for (id in otherStudents) {
            if (!Object.prototype.hasOwnProperty.call(otherStudents, id)) {
                continue;
            }
            if (!seen[id]) {
                if (studentMoves[id]) {
                    studentMoves[id].done = true;
                    delete studentMoves[id];
                }
                otherStudents[id].map = null;
                delete otherStudents[id];
            }
        }
    }

    function flightField(row, name) {
        if (!row) {
            return '';
        }
        if (row[name] !== undefined && row[name] !== null) {
            return row[name];
        }
        if (row[name.toUpperCase()] !== undefined && row[name.toUpperCase()] !== null) {
            return row[name.toUpperCase()];
        }
        return '';
    }

    destinationName = hickory.name;
    destinationCountry = hickory.country;
    postFlight(hickory.lat, hickory.lng, true);
    readFlights();
    setInterval(readFlights, 3000);

}

$(initMap);

function iconFromCodePoint(codePoint) {
    var parts = String(codePoint || '').split('-');
    var chars = '';
    var i;
    var point;
    for (i = 0; i < parts.length; i++) {
        point = parseInt(parts[i], 16);
        if (!isNaN(point)) {
            chars += String.fromCodePoint(point);
        }
    }
    if (!chars) {
        chars = String.fromCodePoint(0x2708, 0xFE0F);
    }
    return chars;
}

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
