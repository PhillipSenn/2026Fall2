<cfscript>
include '/Inc/header6.cfm'
q = new dbo.proc().exec('q.usrs_act',form.actid)
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		
	</header>
	<section>
      <table>
         <thead>
            <tr>
               <th class="text-end">Chapter</th>
               <th>Name</th>
               <th class="text-center">Author</th>
               <th class="text-center">Student</th>
            </tr>
         </thead>
         <tbody>
            <cfloop query="q">
               <tr>
                  <td class="text-end">#qsort#</td>
                  <td>
                     <a href="q.cfm?actid=#form.actid#&qid=#qid#">#qname#</a>
                  </td>
                  <td class="text-center">
                     <cfif fileExists(request.pgmDir & 'png/#qsort#.fw.png')>
                        <img src="png/#qsort#.fw.png" width="100px">
                     </cfif>
                  </td>
                  <td class="text-center">
                     <cfif len(pollname)>
                        <cfset imgSrc = left(pollname, 4) EQ 'http' ? pollname : 'uploads/#pollname#'>
                        <a href="#imgSrc#">
                           <img src="#imgSrc#" width="200px">
                        </a>
                     </cfif>
                  </td>
               </tr>
            </cfloop>
         </tbody>
      </table>
	</section>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
