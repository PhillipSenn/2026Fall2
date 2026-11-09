<cfscript>
usrs = new dbo.proc().exec('usrs.where_act',form.actid)
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<article>
    <header>
        actid: #actid#
    </header>
    <section>
        <table>
            <thead>
                <tr>
                    <th>First Name</th>
                    <th class="text-end">Earned</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="usrs">
                    <tr>
                        <td>
                            <a href="#request.home#?id=#id#">#firstname# <span class="bi bi-person"></span></a>
                        </td>
                        <td class="text-end">#earned#</td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </section>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>