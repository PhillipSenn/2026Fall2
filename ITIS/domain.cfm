<cfscript>
request.title = 'domain'
request.progress.bar = false
include '/Inc/header.cfm'
domain = queryExecute(
	"select * from domain order by domainname"
)
</cfscript>

<cfoutput query="act">
<form class="card" action="kingdom.cfm">
	<div class="card-body">
		<cfloop query="domain">
			<div>
				<button class="btn-link" name="domainid" value="#domainid#">#domainname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
	<div class="card-footer"><pre>
Human:  Eukaryota → Animalia → Chordata → Mammalia → Primates → Hominidae → Homo → Homo sapiens
Dog:    Eukaryota → Animalia → Chordata → Mammalia → Carnivora → Canidae → Canis → Canis lupus → Canis lupus familiaris
Cat:    Eukaryota → Animalia → Chordata → Mammalia → Carnivora → Felidae → Felis → Felis catus
Horse:  Eukaryota → Animalia → Chordata → Mammalia → Perissodactyla → Equidae → Equus → Equus caballus
Donkey: Eukaryota → Animalia → Chordata → Mammalia → Perissodactyla → Equidae → Equus → Equus asinus
Cattle: Eukaryota → Animalia → Chordata → Mammalia → Artiodactyla → Bovidae → Bos → Bos taurus
Goats:  Eukaryota → Animalia → Chordata → Mammalia → Artiodactyla → Bovidae → Capra → Capra hircus
Sheep:  Eukaryota → Animalia → Chordata → Mammalia → Artiodactyla → Bovidae → Ovis → Ovis aries
Swine:  Eukaryota → Animalia → Chordata → Mammalia → Artiodactyla → Suidae → Sus → Sus scrofa
Ducks:  Eukaryota → Animalia → Chordata → Aves → Anseriformes → Anatidae → Anas → Anas platyrhynchos
Muscovy 
Ducks:  Eukaryota → Animalia → Chordata → Aves → Anseriformes → Anatidae → Anas → Cairina moschata
</pre>
	</div>
</form>
<button class="nav-link" name="actid" value="#actid#" formaction="domain.cfm">Domain</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
