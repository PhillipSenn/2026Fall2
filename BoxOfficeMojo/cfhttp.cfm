<cfscript>
movie = queryExecute('select top 1 movieid,moviename 
from movie
left join credit on credit_movie=movieid
where credit_movie is null
order by gross desc
',{},	{ datasource: 'boxofficemojo' }
)
if (!movie.recordCount()) {
   writeOutput('Finished!')
   abort;
}
writeoutput('<h1>#movie.moviename#</h1>')
imdbID = movie.movieid
myurl = 'https://www.boxofficemojo.com/title/'
    & imdbID & '/credits/';

cfhttp(
    url=myurl,
    method='GET',
    result='response',
    timeout=30
) {
    cfhttpparam(
        type='header',
        name='User-Agent',
        value='Mozilla/5.0'
    );
}

//writeOutput('<p>Status: ' & encodeForHTML(response.statusCode) & '</p>');
writeOutput('<textarea hidden rows="25" style="width:100%">'
    & encodeForHTML(response.fileContent)
    & '</textarea>');

doc = createObject(
    'java',
    'org.jsoup.Jsoup'
).parse(response.fileContent);

credits = [];

for (tableID in ['principalCast', 'principalCrew']) {
    table = doc.getElementById(tableID);

    if (isNull(table)) {
        continue;
    }

    rows = table.select('tr');

    for (row in rows) {
        cells = row.select('td');

        if (cells.size() != 2) {
            continue;
        }

        roleName = cells.get(0).text();

        for (person in cells.get(1).select('a[href*=/name/nm]')) {
            personURL = person.attr('href');
            imdbPersonID = reReplace(
                personURL,
                '^.*?/name/(nm[0-9]+).*$',
                '\1'
            );

            credits.append({
                'MovieID' = imdbID,
                'PersonID' = imdbPersonID,
                'PersonName' = person.text(),
                'CreditType' = tableID == 'principalCast'
                    ? 'Actor'
                    : roleName,
                'CharacterName' = tableID == 'principalCast'
                    ? roleName
                    : ''
            });
        }
    }
}

seenCreditTypes = {}
for (credit in credits) {
	creditTypeName = credit.CreditType
	if (structKeyExists(seenCreditTypes, creditTypeName)) {
		continue
	}
	seenCreditTypes[creditTypeName] = true
	existing = queryExecute(
		"SELECT credittypename
		FROM credittype
		WHERE credittypename = :credittypename",
		{ credittypename: { value: creditTypeName, cfsqltype: 'cf_sql_varchar' } },
		{ datasource: 'boxofficemojo' }
	)
	if (!existing.recordCount) {
		queryExecute(
			"INSERT INTO credittype (credittypename)
			VALUES (:credittypename)",
			{ credittypename: { value: creditTypeName, cfsqltype: 'cf_sql_varchar' } },
			{ datasource: 'boxofficemojo' }
		)
	}
}

seenCharacters = {}
for (credit in credits) {
	characterName = credit.CharacterName
	if (!len(trim(characterName))) {
		continue
	}
	if (structKeyExists(seenCharacters, characterName)) {
		continue
	}
	seenCharacters[characterName] = true
	existing = queryExecute(
		"SELECT charactername
		FROM [character]
		WHERE charactername = :charactername",
		{ charactername: { value: characterName, cfsqltype: 'cf_sql_nvarchar' } },
		{ datasource: 'boxofficemojo' }
	)
	if (!existing.recordCount) {
		queryExecute(
			"INSERT INTO [character] (charactername)
			VALUES (:charactername)",
			{ charactername: { value: characterName, cfsqltype: 'cf_sql_nvarchar' } },
			{ datasource: 'boxofficemojo' }
		)
	}
}

seenPersons = {}
for (credit in credits) {
	personID = credit.PersonID
	if (structKeyExists(seenPersons, personID)) {
		continue
	}
	seenPersons[personID] = true
	existing = queryExecute(
		"SELECT personid
		FROM person
		WHERE personid = :personid",
		{ personid: { value: personID, cfsqltype: 'cf_sql_varchar' } },
		{ datasource: 'boxofficemojo' }
	)
	if (!existing.recordCount) {
		queryExecute(
			"INSERT INTO person (personid, personname)
			VALUES (:personid, :personname)",
			{
				personid: { value: personID, cfsqltype: 'cf_sql_varchar' },
				personname: { value: credit.PersonName, cfsqltype: 'cf_sql_nvarchar' }
			},
			{ datasource: 'boxofficemojo' }
		)
	}
}

seenCredits = {}
for (credit in credits) {
	creditKey = credit.MovieID & '|' & credit.PersonID & '|' & credit.CreditType
	if (structKeyExists(seenCredits, creditKey)) {
		continue
	}
	seenCredits[creditKey] = true
	creditType = queryExecute(
		"SELECT creditTypeid
		FROM creditType
		WHERE creditTypename = :credittypename",
		{ credittypename: { value: credit.CreditType, cfsqltype: 'cf_sql_varchar' } },
		{ datasource: 'boxofficemojo' }
	)
	if (!creditType.recordCount) {
		continue
	}
	characterID = ''
	if (len(trim(credit.CharacterName))) {
		character = queryExecute(
			"SELECT characterid
			FROM [character]
			WHERE charactername = :charactername",
			{ charactername: { value: credit.CharacterName, cfsqltype: 'cf_sql_nvarchar' } },
			{ datasource: 'boxofficemojo' }
		)
		if (character.recordCount) {
			characterID = character.characterid
		}
	}
	existing = queryExecute(
		"SELECT creditid
		FROM credit
		WHERE credit_movie = :movieid
			AND credit_person = :personid
			AND credit_type = :credittypeid",
		{
			movieid: { value: credit.MovieID, cfsqltype: 'cf_sql_varchar' },
			personid: { value: credit.PersonID, cfsqltype: 'cf_sql_varchar' },
			credittypeid: { value: creditType.creditTypeid, cfsqltype: 'cf_sql_integer' }
		},
		{ datasource: 'boxofficemojo' }
	)
	if (!existing.recordCount) {
		queryExecute(
			"INSERT INTO credit (credit_movie, credit_person, credit_type, credit_character)
			VALUES (:movieid, :personid, :credittypeid, :characterid)",
			{
				movieid: { value: credit.MovieID, cfsqltype: 'cf_sql_varchar' },
				personid: { value: credit.PersonID, cfsqltype: 'cf_sql_varchar' },
				credittypeid: { value: creditType.creditTypeid, cfsqltype: 'cf_sql_integer' },
				characterid: {
					value: characterID,
					cfsqltype: 'cf_sql_integer',
					null: !isNumeric(characterID)
				}
			},
			{ datasource: 'boxofficemojo' }
		)
	}
}

writeDump(credits);
</cfscript>
<html>
<body>
<script>
setTimeout(doit,2000)

function doit() {
   location.reload()
}
</script>
</body>
</html>