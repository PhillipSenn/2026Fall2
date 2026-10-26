"""Generate UTF-8 CSV of major US airports and US territories from OurAirports."""
import csv
import io
import urllib.request
from pathlib import Path

# Selected commercial airports, including major hubs and regional gateways.
AIRPORTS = {
'AL':'BHM HSV MOB MGM DHN MSL','AK':'ANC FAI JNU KTN SIT BET ADQ OTZ OME BRW DLG ENA SCC CDV YAK PSG','AZ':'PHX TUS FLG YUM PRC IFP AZA','AR':'LIT XNA FSM TXK HOT','CA':'LAX SFO SAN SJC OAK SMF SNA ONT BUR LGB PSP FAT SBA SBP MRY RDD ACV STS BFL SMX IPL','CO':'DEN COS ASE EGE GJT MTJ DRO HDN PUB GUC ALS','CT':'BDL HVN','DE':'ILG','FL':'MIA MCO FLL TPA RSW PBI JAX PNS SRQ VPS ECP DAB MLB GNV TLH EYW PIE SFB PGD','GA':'ATL SAV AGS CSG VLD ABY BQK','HI':'HNL OGG KOA LIH ITO MKK LNY HNM','ID':'BOI IDA SUN PIH TWF LWS','IL':'ORD MDW RFD PIA BMI MLI SPI CMI BLV','IN':'IND SBN FWA EVV LAF','IA':'DSM CID SUX ALO DBQ MCW','KS':'ICT MHK GCK HUT SLN','KY':'CVG SDF LEX PAH OWB','LA':'MSY BTR SHV LFT AEX MLU LCH','ME':'PWM BGR BHB AUG PQI RKD','MD':'BWI HGR SBY','MA':'BOS ORH ACK MVY HYA BED','MI':'DTW GRR FNT LAN AZO MBS TVC PLN APN MQT CMX ESC','MN':'MSP RST DLH STC BJI BRD INL HIB','MS':'JAN GPT GTR MEI PIB','MO':'STL MCI SGF COU JLN CGI','MT':'BIL BZN MSO GTF FCA HLN BTM WYS','NE':'OMA LNK GRI BFF EAR','NV':'LAS RNO EKO','NH':'MHT PSM LEB','NJ':'EWR ACY TTN','NM':'ABQ SAF ROW FMN HOB CNM','NY':'JFK LGA BUF ROC SYR ALB ISP HPN SWF BGM ITH ELM ART MSS','NC':'CLT RDU GSO AVL ILM FAY OAJ PGV EWN USA','ND':'FAR BIS GFK MOT DIK ISN JMS','OH':'CLE CMH CVG DAY CAK TOL LCK YNG','OK':'OKC TUL LAW SWO','OR':'PDX EUG MFR RDM OTH LMT PDT','PA':'PHL PIT MDT ABE AVP ERI SCE LBE IPT','RI':'PVD','SC':'CHS GSP MYR CAE FLO HHH','SD':'FSD RAP ABR PIR ATY','TN':'BNA MEM TYS CHA TRI','TX':'DFW IAH DAL HOU AUS SAT ELP LBB MAF AMA CRP HRL BRO MFE GRK ACT ABI SJT TYR GGG BPT CLL','UT':'SLC PVU SGU CDC CNY','VT':'BTV RUT','VA':'IAD DCA RIC ORF ROA CHO PHF LYH SHD','WA':'SEA GEG PAE BLI PSC YKM ALW EAT PUW','WV':'CRW HTS CKB LWB BKW','WI':'MKE MSN GRB ATW CWA EAU LSE RHI','WY':'JAC CPR CYS RKS GCC SHR LAR','DC':'',
'PR':'SJU BQN PSE VQS CPX MAZ','GU':'GUM','VI':'STT STX','AS':'PPG','MP':'SPN TNI ROP',
}
NAMES = {'AL':'Alabama','AK':'Alaska','AZ':'Arizona','AR':'Arkansas','CA':'California','CO':'Colorado','CT':'Connecticut','DE':'Delaware','FL':'Florida','GA':'Georgia','HI':'Hawaii','ID':'Idaho','IL':'Illinois','IN':'Indiana','IA':'Iowa','KS':'Kansas','KY':'Kentucky','LA':'Louisiana','ME':'Maine','MD':'Maryland','MA':'Massachusetts','MI':'Michigan','MN':'Minnesota','MS':'Mississippi','MO':'Missouri','MT':'Montana','NE':'Nebraska','NV':'Nevada','NH':'New Hampshire','NJ':'New Jersey','NM':'New Mexico','NY':'New York','NC':'North Carolina','ND':'North Dakota','OH':'Ohio','OK':'Oklahoma','OR':'Oregon','PA':'Pennsylvania','RI':'Rhode Island','SC':'South Carolina','SD':'South Dakota','TN':'Tennessee','TX':'Texas','UT':'Utah','VT':'Vermont','VA':'Virginia','WA':'Washington','WV':'West Virginia','WI':'Wisconsin','WY':'Wyoming','DC':'District of Columbia','PR':'Puerto Rico','GU':'Guam','VI':'U.S. Virgin Islands','AS':'American Samoa','MP':'Northern Mariana Islands','CU':'Guantánamo Bay Naval Base (Cuba)'}
URL='https://davidmegginson.github.io/ourairports-data/airports.csv'
req=urllib.request.Request(URL,headers={'User-Agent':'Mozilla/5.0'})
with urllib.request.urlopen(req,timeout=60) as response:
    records=list(csv.DictReader(io.TextIOWrapper(response,encoding='utf-8-sig')))
by_code={}
for r in records:
    code=r['iata_code'].strip().upper()
    if code and r['type']!='closed':
        by_code.setdefault(code,[]).append(r)
rows=[]; missing=[]
for abbr, codes in AIRPORTS.items():
    for code in codes.split():
        matches=by_code.get(code,[])
        # Prefer airports in the expected state/territory; avoid duplicate worldwide codes.
        matches.sort(key=lambda r:(r['iso_region'] != 'US-'+abbr, r['iso_country'] not in ('US','PR','GU','VI','AS','MP'),r['type']!='large_airport',r['type']!='medium_airport'))
        if not matches:
            missing.append(code);continue
        r=matches[0]
        if r['iso_region'] != 'US-'+abbr and r['iso_country'] not in ('PR','GU','VI','AS','MP') and not (abbr=='OH' and code=='CVG') and not (abbr=='KY' and code=='CVG'):
            print('Check state:',abbr,code,r['iso_region'])
        rows.append([code,r['name'],r['latitude_deg'],r['longitude_deg'],NAMES[abbr],abbr])
# CVG is physically in Kentucky, not Ohio. Keep it only in Kentucky.
rows=[r for r in rows if not (r[0]=='CVG' and r[5]=='OH')]
# DCA/IAD are physically in Virginia; DC has no major commercial airport within its borders.
# Add one federal installation outside US sovereign territory separately.
if 'NBW' in by_code:
    r=by_code['NBW'][0]
    rows.append(['NBW',r['name'],r['latitude_deg'],r['longitude_deg'],NAMES['CU'],'CU'])
else: missing.append('NBW')
rows.sort(key=lambda r:(r[5],r[0]))
output=Path(__file__).with_name('us_major_airports.csv')
with output.open('w',encoding='utf-8-sig',newline='') as f:
    w=csv.writer(f);w.writerow(['IATA','AirportName','Latitude','Longitude','StateName','StateAbbreviation']);w.writerows(rows)
print(f'Wrote {len(rows)} airports to {output}')
print('Missing codes:',', '.join(missing) or 'none')
