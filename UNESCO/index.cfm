<cfscript>
include '/Inc/header6.cfm'
row = queryExecute('
select rowid,sitename,short_description,image_url,danger,extension,transnational
	,categoryid,categoryname
   ,ug_row
from row
join category on row_category=categoryid
join (
   select poi_row
   from poi
   group by poi_row
) poi
on poi_row=rowid
left join ug on ug_usr=#request.usr.usrid# and ug_row=rowid
order by isnull(ugid,0) desc,rowid',{},{datasource='UNESCO'})



category = queryExecute('
select categoryid,categoryname
from category
order by categoryid',{},{datasource='UNESCO'})
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle sticky-top">
      <a href="geoguessr.cfm?actid=#form.actid#" class="btn float-end">Next!</a>
   </header>
	<section>
		<table id="sites">
			<thead>
				<tr>
					<th>Image</th>
					<th class="sort-col" data-sort="rowid" role="button">Site</th>
					<th class="sort-col text-center" data-sort="danger" role="button">Danger</th>
					<th class="sort-col text-center" data-sort="extension" role="button">Extension</th>
					<th class="sort-col text-center" data-sort="transnational" role="button">Transnational</th>
					<th>
						<select id="filter-category" class="form-select form-select-sm w-auto form-control">
							<option value="">Category</option>
							<cfloop query="category">
								<option value="#categoryid#">#categoryname#</option>
							</cfloop>
						</select>
					</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="row">
					<tr data-rowid="#rowid#" data-danger="#val(danger)#" data-extension="#val(extension)#" data-transnational="#val(transnational)#" data-categoryid="#categoryid#">
						<td>
                     <cfif val(ug_row)>
								<img width="200px" src="#image_url#" class="img-thumbnail">
                     <cfelse>
                        <a href="geoguessr.cfm?actid=#form.actid#&rowid=#rowid#">
                           <img width="200px" src="#image_url#">
                        </a>
                     </cfif>
						</td>
						<td>
                     <p>#rowid#. #sitename#</p>
                     <div class="short-description">#short_description#</div>
                  </td>
						<td>
							<cfif danger><span class="fg-danger">Danger</span></cfif>
						</td>
						<td>
							<cfif extension>Extension</cfif>
						</td>
						<td>
							<cfif transnational><span class="fg-info">Transnational</span></cfif>
						</td>
						<td>#categoryname#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</section>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
