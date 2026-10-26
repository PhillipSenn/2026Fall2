<cfscript>
setting showdebugoutput=false;
cfcontent(reset=true, type="application/json");
param name="form.airportname" default="";
param name="form.cityname" default="";
param name="form.countryname" default="";
param name="form.latitude" default="";
param name="form.longitude" default="";
param name="form.postedat" default="0";
</cfscript>

<cflock scope="application" type="exclusive" timeout="5">
	<cfif !structKeyExists(application, "flight") || structKeyExists(application.flight, "latitude")>
		<cfset application.flight = {}>
	</cfif>
	<cfif isNumeric(form.latitude) && isNumeric(form.longitude)>
		<cfset incomingAt = val(form.postedat)>
		<cfset currentAt = 0>
		<cfif structKeyExists(application.flight, request.usr.id)>
			<cfset saved = application.flight[request.usr.id]>
			<cfif structKeyExists(saved, "postedat")>
				<cfset currentAt = val(saved.postedat)>
			<cfelseif structKeyExists(saved, "POSTEDAT")>
				<cfset currentAt = val(saved.POSTEDAT)>
			</cfif>
		</cfif>
		<cfif incomingAt GTE currentAt>
			<cfset application.flight[request.usr.id] = {
				id: request.usr.id,
				firstname: request.usr.firstname,
				airportname: trim(form.airportname),
				cityname: trim(form.cityname),
				countryname: trim(form.countryname),
				latitude: val(form.latitude),
				longitude: val(form.longitude),
				postedat: incomingAt,
				codePoint: request.usr.codePoint
			}>
		</cfif>
	</cfif>
	<cfset payload = duplicate(application.flight)>
</cflock>

<cfoutput>#serializeJSON(payload)#</cfoutput>
