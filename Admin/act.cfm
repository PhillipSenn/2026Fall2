<cfscript>
usrs = new dbo.proc().exec('usrs.where_act',form.actid)
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
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
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>