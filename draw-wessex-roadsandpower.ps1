<#
SYMBOLTYPE
100 Highway Authority Route
108  Highway Authority Ramp
200 Interstate
208 Interstate Ramp
300 US Highway
308 US Highway Ramp
400 State Highway
408 State Highway Ramp
500 County 500 Route
508 County 500 Ramp
600 Other County Route
608 Other County Ramp
700 Local Road
708 Local Ramp
900 Alley

ACCESSTYPE
N Non-Restricted
R Restricted
UNK Unknown
#>

v.extract input=ESSEXMunicipalities where="MUN in ('CALDWELL BORO','CEDAR GROVE TWP','ESSEX FELLS BORO','FAIRFIELD TWP','GLEN RIDGE BORO','LIVINGSTON TWP','MONTCLAIR TWP','NORTH CALDWELL BORO','ROSELAND BORO','VERONA TWP','WEST CALDWELL TWP','WEST ORANGE TWP')" output=WESSEXMuni --overwrite
v.extract -d input=WESSEXMuni output=WESSEXBoundary new=1 --overwrite

v.extract --verbose input=ESSEXCountyParcels where="MUN_NAME in ('CALDWELL BORO TWP','CEDAR GROVE TWP','ESSEX FELLS TWP','FAIRFIELD TWP','GLEN RIDGE BORO','LIVINGSTON TWP','MONTCLAIR TWP','NORTH CALDWELL TWP','ROSELAND BORO','VERONA TWP','WEST CALDWELL TWP','WEST ORANGE TWP') AND LAND_VAL IS NOT NULL" output=WESSEXParcels --overwrite
v.info map=WESSEXParcels
g.region vector=WESSEXParcels

db.select sql="select GNIS from WESSEXMuni order by MUN"
<#
GNIS
'2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718' #>

v.clip input=Railroads_Network clip=WESSEXBoundary output=WESSEXRailroads
# v.clip input=Tran_road_centerline_NJ clip=WESSEXBoundary output=WESSEXRoads
v.clip input=NJPowerLines clip=WESSEXBoundary output=WESSEXPowerLines
v.extract --verbose input=Tran_road_centerline_NJ where="MUNI_L in ('2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718') OR MUNI_R in ('2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718')" output=WESSEXRoads
v.extract --verbose input=WESSEXParcels output=WESSEXUseParcels where="USE is not 2 and TAX=0" --overwrite
v.extract --verbose input=WESSEXParcels output=WESSEXNonResTaxedParcels where="USE is not 2 and TAX > 0"
v.colors --verbose map=WESSEXParcels color=wessexrestax use=attr column=TAX
v.colors --verbose map=WESSEXNonResTaxedParcels color=wessexrestax use=attr column=TAX
v.colors --verbose map=WESSEXUseParcels color=parceluse use=attr column=USE


g.gisenv set="DEBUG=0"
d.mon start=wx2 resolution=2
d.erase
d.vect map=WESSEXParcels where="USE=2"
d.vect map=WESSEXNonResTaxedParcels
d.vect map=WESSEXUseParcels
d.vect map=WESSEXUseParcels type=boundary color=200:200:200 width=1
d.vect map=WESSEXRoads where="SYMBOLTYPE=100" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=200" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=300" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=400" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=108" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=208" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=308" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=408" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=108" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=208" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=308" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=408" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=WESSEXRailroads width=4 color=99:45:1
d.vect map=WESSEXRailroads width=2 color=237:178:130
d.vect map=WESSEXPowerLines width=3 color=145:145:142
d.vect map=WESSEXPowerLines width=1 color=247:238:170
d.vect map=WESSEXMuni type=boundary width=2 color=150:150:150
d.vect map=WESSEXBoundary type=boundary width=2 color=black