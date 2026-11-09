<cfscript>
request.progress.bar = false
include '/Inc/header6.cfm'
geoguessr = new dbo.proc().usr('geoguessr.list')
</cfscript>

<cfoutput>
<article>
    <header class="theme-primary theme-subtle">
        Locations
    </header>
    <section>
        <table>
            <thead>
                <tr>
                    <th class="text-end">Row</th>
                    <th>First name</th>
                    <th>Results</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="geoguessr">
                    <tr>
                        <td class="text-end">
                            <cfif len(guessr_geo)>
                                #currentRow#
                            <cfelse>
                                <a href="guessr.cfm?actid=#form.actid#&qid=#qid#">#currentRow#</a>
                            </cfif>
                        </td>
                        <td>#firstname#</td>
                        <td>
                            <cfif len(guessr_geo)>
                                <a href="winner.cfm?actid=345&qid=#qid#">Results</a>
                            </cfif>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </section>
    <footer>
        <a class="btn" href="create.cfm?actid=344">Create a new one</a>
    </footer>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
