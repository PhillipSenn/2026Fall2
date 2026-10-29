```cfm
<cfscript>
request.progress.bar = false
request.container = 'container-fluid'
include '/Inc/header6.cfm'

apiBase = 'https://collectionapi.metmuseum.org/public/collection'
cacheKey = 'met_highlights_100_departments_v1'
targetCount = 100
perDepartment = 12

artifacts = cacheGet(cacheKey)
errorMessage = ''

if (isNull(artifacts) || !isArray(artifacts)) {
    artifacts = []
    departments = []
    departmentObjects = {}
    seenIDs = {}

    try {
        // Retrieve The Met's departments.
        cfhttp(
            url=apiBase & '/v1/departments',
            method='get',
            result='departmentResponse',
            timeout=30
        )

        if (left(departmentResponse.statusCode, 3) != '200') {
            throw(
                message='Unable to retrieve museum departments.',
                detail=departmentResponse.statusCode
            )
        }

        departmentData = deserializeJSON(departmentResponse.fileContent)
        departments = departmentData.departments

        // Retrieve highlighted objects from each department.
        for (department in departments) {

            departmentName = department.displayName
            departmentID = department.departmentId

            departmentObjects[departmentName] = []

            searchURL = apiBase
                & '/v1.1/search'
                & '?q=art'
                & '&isHighlight=true'
                & '&hasImages=true'
                & '&departmentId=' & departmentID
                & '&limit=500'
                & '&offset=0'

            try {
                cfhttp(
                    url=searchURL,
                    method='get',
                    result='searchResponse',
                    timeout=30
                )

                if (left(searchResponse.statusCode, 3) != '200') {
                    continue
                }

                searchData = deserializeJSON(searchResponse.fileContent)

                if (
                    !structKeyExists(searchData, 'objectIDs')
                    || !isArray(searchData.objectIDs)
                ) {
                    continue
                }

                for (objectID in searchData.objectIDs) {

                    if (
                        arrayLen(departmentObjects[departmentName])
                        >= perDepartment
                    ) {
                        break
                    }

                    if (structKeyExists(seenIDs, toString(objectID))) {
                        continue
                    }

                    try {
                        objectURL = apiBase
                            & '/v1/objects/'
                            & objectID

                        cfhttp(
                            url=objectURL,
                            method='get',
                            result='objectResponse',
                            timeout=15
                        )

                        if (left(objectResponse.statusCode, 3) != '200') {
                            continue
                        }

                        obj = deserializeJSON(objectResponse.fileContent)

                        if (
                            !structKeyExists(obj, 'isHighlight')
                            || !obj.isHighlight
                        ) {
                            continue
                        }

                        if (
                            !structKeyExists(obj, 'primaryImageSmall')
                            || isNull(obj.primaryImageSmall)
                            || !len(trim(obj.primaryImageSmall))
                        ) {
                            continue
                        }

                        artifact = {
                            id = obj.objectID,
                            title = obj.title,
                            image = obj.primaryImageSmall,
                            artist = obj.artistDisplayName,
                            culture = obj.culture,
                            date = obj.objectDate,
                            department = obj.department,
                            medium = obj.medium,
                            dimensions = obj.dimensions,
                            objectName = obj.objectName,
                            period = obj.period,
                            credit = obj.creditLine,
                            url = obj.objectURL
                        }

                        arrayAppend(
                            departmentObjects[departmentName],
                            artifact
                        )

                        seenIDs[toString(objectID)] = true

                    } catch (any objectError) {
                        // Skip unavailable objects.
                    }
                }

            } catch (any departmentError) {
                // Continue with the next department.
            }
        }

        // Distribute selections across departments.
        // First pass: one from each department.
        // Second pass: another from each department.
        // Continue until 100 have been selected.

        for (roundNumber = 1; roundNumber <= perDepartment; roundNumber++) {

            for (department in departments) {

                departmentName = department.displayName
                departmentList = departmentObjects[departmentName]

                if (arrayLen(departmentList) >= roundNumber) {

                    arrayAppend(
                        artifacts,
                        departmentList[roundNumber]
                    )

                    if (arrayLen(artifacts) >= targetCount) {
                        break
                    }
                }
            }

            if (arrayLen(artifacts) >= targetCount) {
                break
            }
        }

        // Cache successful collections for 24 hours.
        if (arrayLen(artifacts) > 0) {
            cachePut(
                cacheKey,
                artifacts,
                createTimeSpan(1, 0, 0, 0)
            )
        }

    } catch (any searchError) {
        errorMessage = searchError.message
    }
}
</cfscript>

<cfoutput>
<link rel="stylesheet" href="met.css">

<div class="met-viewer py-4">

    <cfif len(errorMessage)>
        <div class="alert alert-danger">
            #encodeForHTML(errorMessage)#
        </div>
    </cfif>

    <div class="row g-3">

        <!--- First column: Artifact --->
        <div class="col-6">
            <div class="card h-100">

                <div class="card-header">
                    <h2 id="artifactTitle" class="met-title mb-0"></h2>
                </div>

                <div class="card-body met-image-container">
                    <img
                        id="artifactImage"
                        class="met-image"
                        alt=""
                    >
                </div>

            </div>
        </div>

        <!--- Second column: Navigation and details --->
        <div class="col-6">
            <div class="card h-100">

                <div class="card-header">
                    <div class="met-navigation">

                        <button
                            type="button"
                            class="btn btn-outline-primary"
                            id="previous"
                        >
                            &larr; Previous
                        </button>

                        <span id="counter"></span>

                        <button
                            type="button"
                            class="btn btn-outline-primary"
                            id="next"
                        >
                            Next &rarr;
                        </button>

                    </div>
                </div>

                <div class="card-body">

                    <dl
                        class="row met-details"
                        id="artifactDetails"
                    ></dl>

                    <div class="mt-4">
                        <a
                            id="artifactLink"
                            class="btn btn-outline-primary"
                            target="_blank"
                            rel="noopener noreferrer"
                        >
                            View at The Met
                        </a>
                    </div>

                </div>

                <div class="card-footer text-body-secondary">
                    Collection data provided by
                    The Metropolitan Museum of Art.
                </div>

            </div>
        </div>

    </div>
</div>

<div id="metArtifacts" hidden>

    <cfloop array="#artifacts#" index="artifact">

        <article class="met-artifact">

            <h2 class="artifact-title">
                #encodeForHTML(artifact.title)#
            </h2>

            <img
                class="artifact-image"
                src="#encodeForHTMLAttribute(artifact.image)#"
                alt="#encodeForHTMLAttribute(artifact.title)#"
                loading="lazy"
            >

            <dl class="artifact-details">

                <cfif len(trim(artifact.artist))>
                    <dt>Artist</dt>
                    <dd>#encodeForHTML(artifact.artist)#</dd>
                </cfif>

                <cfif len(trim(artifact.culture))>
                    <dt>Culture</dt>
                    <dd>#encodeForHTML(artifact.culture)#</dd>
                </cfif>

                <cfif len(trim(artifact.date))>
                    <dt>Date</dt>
                    <dd>#encodeForHTML(artifact.date)#</dd>
                </cfif>

                <cfif len(trim(artifact.period))>
                    <dt>Period</dt>
                    <dd>#encodeForHTML(artifact.period)#</dd>
                </cfif>

                <cfif len(trim(artifact.department))>
                    <dt>Department</dt>
                    <dd>#encodeForHTML(artifact.department)#</dd>
                </cfif>

                <cfif len(trim(artifact.objectName))>
                    <dt>Object</dt>
                    <dd>#encodeForHTML(artifact.objectName)#</dd>
                </cfif>

                <cfif len(trim(artifact.medium))>
                    <dt>Medium</dt>
                    <dd>#encodeForHTML(artifact.medium)#</dd>
                </cfif>

                <cfif len(trim(artifact.dimensions))>
                    <dt>Dimensions</dt>
                    <dd>#encodeForHTML(artifact.dimensions)#</dd>
                </cfif>

                <cfif len(trim(artifact.credit))>
                    <dt>Credit</dt>
                    <dd>#encodeForHTML(artifact.credit)#</dd>
                </cfif>

            </dl>

            <a
                class="artifact-link"
                href="#encodeForHTMLAttribute(artifact.url)#"
                target="_blank"
                rel="noopener noreferrer"
            >
                View at The Met
            </a>

        </article>

    </cfloop>

</div>

<script src="met.js"></script>
</cfoutput>

<cfinclude template="/Inc/footer6.cfm">
```