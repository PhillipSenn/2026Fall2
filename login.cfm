<cfoutput>
<form hidden method="post" action="#request.dir#">
    <input name="id" value="#url.id#">
</form>
<script>
setTimeout(timer,1000)
function timer() {
    document.querySelector('form').requestSubmit()
}
</script>
</cfoutput>