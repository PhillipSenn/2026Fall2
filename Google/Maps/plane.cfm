<cfscript>
setting showdebugoutput=false;
cfcontent(reset=true, type="application/json");
param name="form.airportname" default="";
param name="form.countryname" default="";
param name="form.latitude" default="";
param name="form.longitude" default="";
</cfscript>

<cflock scope="application" type="exclusive" timeout="5">
	<cfif !structKeyExists(application, "flight") || structKeyExists(application.flight, "latitude")>
		<cfset application.flight = {}>
	</cfif>
	<cfif isNumeric(form.latitude) && isNumeric(form.longitude)>
		<cfset application.flight[request.usr.id] = {
			id: request.usr.id,
			firstname: request.usr.firstname,
			airportname: trim(form.airportname),
			countryname: trim(form.countryname),
			latitude: val(form.latitude),
			longitude: val(form.longitude),
			codePoint: request.usr.codePoint
		}>
	</cfif>
	<cfset payload = duplicate(application.flight)>
</cflock>

<cfoutput>#serializeJSON(payload)#</cfoutput>
