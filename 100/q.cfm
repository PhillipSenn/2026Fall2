<cfscript>
include '/Inc/header6.cfm'
q = new dbo.proc().exec('q.where_q',url.qid)
ans = new dbo.proc().exec('ans.where_q',q.qid)
</cfscript>

<cfoutput query="act">
<article class="mb-12">
	<cfif structKeyExists(url,'msg') AND len(url.msg)>
		<header class="theme-danger theme-subtle" data-qname="#encodeForHTMLAttribute(q.qname)#">
			#encodeForHTML(url.msg)#
		</header>
	<cfelse>
		<header class="theme-primary theme-subtle">
			#q.qname#
		</header>
	</cfif>
	<section>
      <div class="d-flex gap-3 align-items-start">
         <div class="flex-grow-1">
            <p>#ans.ansname#</p>
            <form action="q_action.cfm" method="post" enctype="multipart/form-data">
               <fieldset>
                  <legend>
                     Picture!
                  </legend>
                  <label for="clientFile" class="form-label">Upload an AI-generated image</label>
                  <input type="file"
                     id="clientFile"
                     name="clientFile"
                     class="form-control"
                     accept="image/png,image/jpeg,image/webp">
                  <p class="my-2">or</p>
                  <label for="pollname" class="form-label">Paste an image URL</label>
                  <input type="url" id="pollname" name="pollname" class="form-control" placeholder="https://">
               </fieldset>
               <button class="mt-3">Save</button>
               <input hidden name="actid" value="#form.actid#">
               <input hidden name="qid" value="#q.qid#">
            </form>
         </div>
         <div id="img_placeholder" class="flex-shrink-0">
            <cfif fileExists(request.pgmDir & 'png/#q.qsort#.fw.png')>
               <img class="img-thumbnail" src="png/#q.qsort#.fw.png" width="280">
            </cfif>
         </div>
      </div>
      <cfloop query="ans" startrow="2">
         <p>#ansname#</p>
      </cfloop>
	</section>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
