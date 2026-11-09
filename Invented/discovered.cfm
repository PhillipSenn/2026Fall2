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
<div class="row">
   <div class="col-6">
      <div class="card">
         <div class="card-header theme-primary theme-subtle">
            In #year#, #prefix.ansname# #q.qname# #suffix.ansname#:
         </div>
         <div class="card-body">
            <cfif len(img.ansname)>
               <a target="_blank" href="#img.ansname#">
                  <img src="#img.ansname#" class="img-fluid img-thumbnail">
               </a>
            </cfif>
         </div>
         <form class="card-footer">
            <input name="ansname" class="form-control" autofocus>
            <img id="ansnamePreview" class="img-fluid img-thumbnail mt-2 d-none" alt="">
            <input hidden name="qid" value="#img.qid#">
            <a target="_blank" href="https://www.google.com/search?tbm=isch&q=#EncodeForURL(year & ' ' & q.qname)#">Google Images</a>
            <button class="float-end">Save</button>
         </form>
      </div>
   </div>
   <div class="col-6">
      <form class="card">
         <div class="card-header">
            &nbsp;
         </div>
         <div class="card-body">
            <div class="btn-group" role="group" aria-label="Possible answers">
               <cfloop query="answers">
                  <button name="ansid" class="btn-outline theme-primary" value="#ansid#">#ansname#</button>
               </cfloop>
            </div>
         </div>
         <div class="card-footer">
            See: <a target="_blank" href="https://online.pubhtml5.com/hmeo/wjuj/?1793911589##p=#page.ansname+1#">
               Page #page.ansname#
            </a>
         </div>
         <input hidden name="id" value="#request.usr.id#">
         <input hidden name="actid" value="#form.actid#">
      </form>
   </div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
