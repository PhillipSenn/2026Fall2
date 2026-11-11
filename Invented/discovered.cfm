<cfscript>
if (structKeyExists(form,'ansname') and len(form.ansname)) {
   new dbo.proc().exec('ans.merge_pix',[form.qid,form.ansname])
}
if (structKeyExists(form,'ansid')) {
   new dbo.proc().usr('guess.invented_discovered',form.ansid)
} else if (structKeyExists(url,'ansid')) {
   new dbo.proc().usr('guess.invented_discovered',url.ansid)
}
request.container = 'container-fluid'
include '/Inc/header6.cfm'
img = new dbo.proc().usr('ans.unanswered_img',form.actid)
q = new dbo.proc().exec('q.where_q',img.qid)
year = q.qsort
if (year < 0) {
   year = -year & ' B.C.'
} else if (year < 1000) {
   year = +year & ' A.D.'
}
prefix = new dbo.proc().exec('ans.q_catname',[q.qid,'prefix'])
suffix = new dbo.proc().exec('ans.q_catname',[q.qid,'suffix'])
page   = new dbo.proc().exec('ans.q_catname',[q.qid,'page'])
answers= new dbo.proc().exec('ans.q_catname',[q.qid,'Possible Answer'])
guess  = new dbo.proc().usr('guess.answered',form.actid)
</cfscript>

<cfoutput query="act">
<form class="row">
   <div class="col-6">
      <article>
         <header class="theme-primary theme-subtle">
            In #year#, #prefix.ansname# #q.qname# #suffix.ansname#:
         </header>
         <section>
            <cfif len(img.ansname)>
               <a target="_blank" href="#img.ansname#">
                  <img src="#img.ansname#" class="img-fluid img-thumbnail">
               </a>
            </cfif>
         </section>
         <footer>
            <input name="ansname" class="form-control" autofocus>
            <img id="ansnamePreview" class="img-fluid img-thumbnail mt-2 d-none" alt="">
            <input hidden name="qid" value="#img.qid#">
            <a target="_blank" href="https://www.google.com/search?tbm=isch&q=#EncodeForURL(year & ' ' & q.qname)#">Google Images</a>
         </footer>
      </article>
   </div>
   <aside>
      <section>
         <header>
            &nbsp;
         </header>
         <section>
            <div class="btn-group" role="group" aria-label="Possible answers">
               <cfloop query="answers">
                  <button name="ansid" class="btn-outline theme-primary" value="#ansid#">#ansname#</button>
               </cfloop>
            </div>
         </section>
         <footer>
            See: <a target="_blank" href="https://online.pubhtml5.com/hmeo/wjuj/?1793911589##p=#page.ansname+1#">
               Page #page.ansname#
            </a>
         </footer>
         <input hidden name="id" value="#request.usr.id#">
         <input hidden name="actid" value="#form.actid#">
      </section>
   </aside>
   <aside style="flex:1 1 0%; min-width:0">
      <table>
         <thead>
            <tr>
               <th>Year</th>
               <th>Item</th>
               <th>Inv</th>
               <th>Disc</th>
            </tr>
         </thead>
         <tbody>
            <cfloop query="guess">
               <cfset guessYear = qsort>
               <cfif guessYear lt 0>
                  <cfset guessYear = -guessYear & ' B.C.'>
               <cfelseif guessYear lt 1000>
                  <cfset guessYear = +guessYear & ' A.D.'>
               </cfif>
               <cfset chosenClass = 'theme-success'>
               <cfif DifferentAnswer ge SameAnswer>
                  <cfset chosenClass = 'theme-danger'>
               </cfif>
               <cfif ansname EQ 'Invented'>
                  <cfset invQty = SameAnswer>
                  <cfset discQty = DifferentAnswer>
                  <cfset invClass = chosenClass>
                  <cfset discClass = 'theme-danger'>
               <cfelse>
                  <cfset invQty = DifferentAnswer>
                  <cfset discQty = SameAnswer>
                  <cfset invClass = 'theme-danger'>
                  <cfset discClass = chosenClass>
               </cfif>
               <tr>
                  <td>#guessYear#</td>
                  <td>#encodeForHtml(qname)#</td>
                  <td class="text-center">
                     <cfif invQty>
                        <a href="Discovered.cfm?actid=#url.actid#&ansid=#ansid#" class="#invClass# underline-10 hover:underline-100">#invQty#</a>
                     </cfif>
                  </td>
                  <td class="text-center">
                     <cfif discQty>
                        <a href="Discovered.cfm?actid=#url.actid#&ansid=#ansid#" class="#discClass# underline-10 hover:underline-100">#discQty#</a>
                     </cfif>
                  </td>
               </tr>
            </cfloop>
         </tbody>
      </table>
   </aside>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
