function renderResults(data) {
    var $area = $('#resultsArea');
    var $table = $('<table>').addClass('table table-striped table-hover table-sm');
    var $head = $('<thead>');
    var $headRow = $('<tr>');
    var $body = $('<tbody>');
    var i;
    var j;
    var column;
    var value;
    var $cell;

    $area.empty();

    $('#resultCount').text(data.rows.length + ' result(s)');

    if (!data.rows.length) {
        $area.text('No matching records. Try a broader query.');
        return;
    }

    for (i = 0; i < data.columns.length; i++) {
        $headRow.append(
            $('<th>')
                .attr('scope', 'col')
                .text(data.columns[i])
        );
    }

    $head.append($headRow);

    for (i = 0; i < data.rows.length; i++) {
        var $row = $('<tr>');

        for (j = 0; j < data.columns.length; j++) {
            column = data.columns[j];
            value = data.rows[i][column] || '';
            $cell = $('<td>');

            if (
                typeof value === 'string' &&
                (
                    value.indexOf('https://www.wikidata.org/') === 0 ||
                    value.indexOf('https://en.wikipedia.org/') === 0
                )
            ) {
                $cell.append(
                    $('<a>')
                        .attr({
                            href: value,
                            target: '_blank',
                            rel: 'noopener noreferrer'
                        })
                        .text(value)
                );
            } else {
                $cell.text(value);
            }

            $row.append($cell);
        }

        $body.append($row);
    }

    $table.append($head).append($body);
    $area.append($table);
}

function querySucceeded(data) {
    var rows = [];
    var columns = [];
    var i;
    var j;
    var binding;
    var row;
    var column;

    $('#runQuery')
        .prop('disabled', false)
        .text('Execute Query');

    if (
        data.head &&
        data.head.vars &&
        data.results &&
        data.results.bindings
    ) {
        columns = data.head.vars;

        for (i = 0; i < data.results.bindings.length; i++) {
            binding = data.results.bindings[i];
            row = {};

            for (j = 0; j < columns.length; j++) {
                column = columns[j];

                row[column] = binding[column]
                    ? binding[column].value
                    : '';
            }

            rows.push(row);
        }

        renderResults({
            columns: columns,
            rows: rows
        });

        if (rows.length) {
            recordGrade();
        }
    } else {
        $('#resultCount').empty();

        $('#resultsArea')
            .empty()
            .append(
                $('<pre>').text(JSON.stringify(data, null, 2))
            );
    }
}

function showEarned(response) {
    var earned = +response;
    var bar = $('.progress-bar');

    if (isNaN(earned)) {
        return response;
    }

    bar.css('width', earned + '%')
        .attr('aria-valuenow', earned)
        .text(earned + '%');

    if (earned >= 100) {
        bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold');
    }

    return response;
}

function recordGrade() {
    var url = '../Grade/merge_act.cfm';
    var form = {};

    form.body = new URLSearchParams();
    form.body.set('id', app.id);
    form.body.set('actid', app.actid);
    form.body.set('earned', 100);

    fetch(url, form)
        .then(text_done)
        .then(showEarned)
        .catch(caught(url));
}

function queryFailed(error) {
    $('#runQuery')
        .prop('disabled', false)
        .text('Execute Query');

    $('#resultsArea').empty();

    $('#queryMessage')
        .text(error.message)
        .addClass('alert alert-warning');
}

function readError(body) {
    return body;
}

function responseReceived(response) {
    if (!response.ok) {
        return response.text().then(function handleError(body) {
            throw new Error(
                'Wikidata returned HTTP ' +
                response.status +
                ': ' +
                body.substring(0, 400)
            );
        });
    }

    return response.json();
}

function submitQuery() {
    var query;

    query = $('#sparqlQuery').val();

    $('#queryMessage')
        .empty()
        .removeClass('alert alert-warning');

    $('#resultCount').empty();

    if (!query.trim()) {
        $('#queryMessage')
            .text('Enter a SPARQL query.')
            .addClass('alert alert-warning');

        return;
    }

    $('#resultsArea').text('Searching Wikidata...');

    $('#runQuery')
        .prop('disabled', true)
        .text('Searching...');

    fetch('https://query.wikidata.org/sparql', {
        method: 'POST',
        headers: {
            'Accept': 'application/sparql-results+json, application/json',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        body: 'query=' + encodeURIComponent(query)
    })
    .then(responseReceived)
    .then(querySucceeded)
    .catch(queryFailed);
}

function clearQuery() {
    $('#sparqlQuery')
        .val('')
        .trigger('focus');

    $('#queryMessage')
        .empty()
        .removeClass('alert alert-warning');

    $('#resultCount').empty();

    $('#resultsArea').text(
        'Your query results will appear here.'
    );
}

function init() {
    $('#runQuery').on('click', submitQuery);
    $('#clearQuery').on('click', clearQuery);
}

init();