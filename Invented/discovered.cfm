<cfscript>
if (structKeyExists(form,'ansname')) {
   new dbo.proc().exec('ans.merge_pix',[form.qid,form.ansname])
} else if (structKeyExists(form,'ansid')) {
   new dbo.proc().usr('guess.invented_discovered',form.ansid)
}
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
</cfscript>

<cfoutput query="act">
<row>
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
         <footer><form>
            <input name="ansname" class="form-control" autofocus>
            <img id="ansnamePreview" class="img-fluid img-thumbnail mt-2 d-none" alt="">
            <input hidden name="qid" value="#img.qid#">
            <a target="_blank" href="https://www.google.com/search?tbm=isch&q=#EncodeForURL(year & ' ' & q.qname)#">Google Images</a>
            <button class="float-end">Save</button>
         </form></footer>
      </article>
   </div>
   <div class="col-6">
      <form class="card">
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
      </form>
   </div>
</row>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
