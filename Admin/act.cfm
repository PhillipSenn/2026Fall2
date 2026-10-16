<cfscript>
usrs = exec('usrs.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<cfinclude template="/Inc/header.cfm">
<div class="card">
    <div class="card-header">
        actid: #actid#
    </div>
    <div class="card-body">
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
                        <td>#firstname#</td>
                        <td class="text-end">#earned#</td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</div>
<button class="nav-link">Scores</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>