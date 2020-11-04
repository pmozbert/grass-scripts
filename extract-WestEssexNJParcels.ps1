########################  WEST ESSEX ##############################################

v.extract input=ESSEXMunicipalities where="MUN in ('CALDWELL BORO','CEDAR GROVE TWP','ESSEX FELLS BORO','FAIRFIELD TWP','GLEN RIDGE BORO','LIVINGSTON TWP','MONTCLAIR TWP','NORTH CALDWELL BORO','ROSELAND BORO','VERONA TWP','WEST CALDWELL TWP','WEST ORANGE TWP')" output=WESSEXMuni --overwrite
v.extract -d input=WESSEXMuni output=WESSEXBoundary new=1 --overwrite

db.describe -c table=ESSEXCountyParcels
db.select sql="select distinct MUN,MUN_NAME from ESSEXCountyParcels order by MUN_NAME"
<# 
0701|BELLEVILLE TWP
0702|BLOOMFIELD TWP
0703|CALDWELL BORO TWP
0704|CEDAR GROVE TWP
0705|EAST ORANGE CITY
0706|ESSEX FELLS TWP
0707|FAIRFIELD TWP
0708|GLEN RIDGE BORO
0709|IRVINGTON TWP
0710|LIVINGSTON TWP
0711|MAPLEWOOD TWP
0712|MILLBURN TWP
0713|MONTCLAIR TWP
0714|NEWARK CITY
0715|NORTH CALDWELL TWP
0716|NUTLEY TWP
0717|ORANGE CITY TWP
0718|ROSELAND BORO
0719|SOUTH ORANGE VILLAGE TW
0720|VERONA TWP
0721|WEST CALDWELL TWP
0722|WEST ORANGE TWP
#>

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

db.select sql="select GNIS from WESSEXMuni order by MUN"
<#'2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718' #>

v.extract --verbose input=ESSEXCountyParcels where="MUN_NAME in ('CALDWELL BORO TWP','CEDAR GROVE TWP','ESSEX FELLS TWP','FAIRFIELD TWP','GLEN RIDGE BORO','LIVINGSTON TWP','MONTCLAIR TWP','NORTH CALDWELL TWP','ROSELAND BORO','VERONA TWP','WEST CALDWELL TWP','WEST ORANGE TWP') AND LAND_VAL IS NOT NULL" output=WESSEXParcels --overwrite
v.info map=WESSEXParcels

v.clip input=Railroads_Network clip=WESSEXBoundary output=WESSEXRailroads
# v.clip input=Tran_road_centerline_NJ clip=WESSEXBoundary output=WESSEXRoads
v.clip input=NJPowerLines clip=WESSEXBoundary output=WESSEXPowerLines
v.extract --verbose input=Tran_road_centerline_NJ where="MUNI_L in ('2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718') OR MUNI_R in ('2381010', '882222', '2390558', '1729722', '2390559', '882219', '1729720', '878839', '885378', '1729716', '1729717', '1729718')" output=WESSEXRoads
v.extract --verbose input=WESSEXParcels output=WESSEXUseParcels where="USE is not 2 and TAX=0" --overwrite
v.extract --verbose input=WESSEXParcels output=WESSEXNonResTaxedParcels where="USE is not 2 and TAX > 0"
v.colors --verbose map=WESSEXParcels color=wessexrestax use=attr column=TAX
v.colors --verbose map=WESSEXNonResTaxedParcels color=wessexrestax use=attr column=TAX
v.colors --verbose map=WESSEXUseParcels color=parceluse use=attr column=USE

