<cfscript>
request.progress.bar = false
include '/Inc/header6.cfm'
geoguessr = new dbo.proc().usr('geoguessr.list')
</cfscript>

<cfoutput>
<div class="card">
    <div class="card-header theme-primary theme-subtle">
        Locations
    </div>
    <div class="card-body">
        <table>
            <thead>
                <tr>
                    <th>Location</th>
                    <th>First name</th>
                    <th>Results</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="geoguessr">
                    <tr>
                        <td>
                            <cfif usrid eq request.usr.usrid>
                                #locationname# <!--- Yours --->
                            <cfelseif len(guessr_geo)>
                                #locationname# <!--- Guessed already --->
                            <cfelse>
                                <a href="guessr.cfm?actid=#form.actid#&geoguessrid=#geoguessrid#">#encodeForHtml(locationname)#</a>
                            </cfif>
                        </td>
                        <td>#firstname#</td>
                        <td>
                            <a href="winner.cfm?actid=346&geoguessrid=#geoguessrid#">Results</a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
    <div class="card-footer">
        <a class="btn" href="create.cfm?actid=344">Create a new one</a>
    </div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
