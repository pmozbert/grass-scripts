$shp = 'C:\gis\data\nj\Govt_census_block_2010\Govt_census_block_2010.shp'
$map='NJ2010CensusBlock'
$shp = 'C:\gis\data\nj\Govt_census_tract_2010\Govt_census_tract_2010.shp'
$map='NJ2010CensusTract'
v.in.ogr input=$shp output=$map

$races = ('WHITE','BLACK','ASIAN','HISPANIC')
foreach($race in $races){
	v.db.addcolumn map=$map columns=`"PCT_"$race" double precision`"
	db.execute sql=`"update "$map" SET PCT_"$race" = "$race" / TOT_POP where TOT_POP `> 0`"
}
	v.db.addcolumn map=$map columns=`"PCT_WHT_ASIAN double precision`"
	db.execute sql=`"update "$map" SET PCT_WHT_ASIAN = WHITE + ASIAN / TOT_POP where TOT_POP `> 0`"


v.colors --verbose map=$map color=pctwhite use=attr column=PCT_WHITE




d.vect map=$map type=area where=`"TOT_POP `> 0`"


$map='NJ2010CensusBlock'
g.region vector=$map
d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map type=area color=none
#d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=300" width=2 color=50:61:186
#d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=118:178:201
#d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=100" width=1 color=118:178:201
#d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170
d.legend -t raster=$mapw units=% range=0,.8 fontsize=10 at=50,99,34,35

######### blk color scale ###############
$map='NJ2010CensusTract'
$county='Essex'
v.extract --verbose input=$map where=`"COUNTYFP10=`'013`'`" output=$map$county
$map = $map + $county
g.region vector=$map
$mapb=$map + 'PctBlk'
v.to.rast input=$map output=$mapb type=area use=attr attribute_column=PCT_BLACK
r.colors map=$mapb color=pctblack



$essexco='013'
#################### nj black ##########################
$map='NJ2010CensusBlock'
g.region vector=$map
v.colors --verbose map=$map color=pctblack use=attr column=PCT_BLACK
d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map type=area color=none
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=118:178:201
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=100" width=1 color=118:178:201
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170
d.legend -t raster=$mapb units=% range=0,.8 fontsize=10 at=50,99,34,35

####################  nj asian ############################
$map='NJ2010CensusBlock'
$mapa=$map + 'PctAsian'
v.to.rast input=$map output=$mapa type=area use=attr attribute_column=PCT_ASIAN
r.colors map=$mapa color=pctasian
v.colors --verbose map=$map color=pctasian use=attr column=PCT_ASIAN
d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map type=area color=none
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=118:178:201
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=100" width=1 color=118:178:201
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170
d.legend -t raster=$mapa units=% range=0,.8 fontsize=10 at=50,99,34,35
###################  essex co ##########################

$map='NJ2010CensusBlock'
$county='Essex'
db.describe -c table=$map

v.extract --verbose input=$map where=`"COUNTYFP10=`'013`'`" output=$map$county
$map = $map + $county
g.region vector=$map
$mapw=$map + 'PctWht'

v.to.rast input=$map output=$mapw type=area use=attr attribute_column=PCT_WHITE
r.colors map=$mapr color=pctwhite

$mapa=$map + 'PctAsian'
v.to.rast input=$map output=$mapa type=area use=attr attribute_column=PCT_ASIAN
r.colors map=$mapa color=pctasian

$maph=$map + 'PctHispanic'
v.to.rast input=NJ2010CensusBlockEssex output=NJ2010CensusBlockPctHispanic type=area use=attr attribute_column=PCT_HISPANIC
r.colors map=NJ2010CensusBlockPctHispanic color=pcthispanic


v.colors --verbose map=$map color=pctwhite use=attr column=PCT_WHITE
v.colors --verbose map=$map color=pctasian use=attr column=PCT_ASIAN

d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map type=area color=none

d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=EssexMunicipalities@Essex type=boundary width=1 color=150:150:150
d.vect map=EssexCounty@Essex type=boundary width=1.5 color=black
d.legend -t raster=$mapw units=% range=0,1 fontsize=10 at=2,22,21,22
d.legend -t raster=$mapa units=% range=0,.5 fontsize=9 at=57,99,21,22 labelnum=5

##################  NJ structures ######################33
$shp='C:\gis\data\nj\STRUCT_New_Jersey_State_Shape\Shape\Struct_Point.shp'
$map='NJStructurePoints'
## do this in new region nj_ll
v.in.ogr input=$shp output=$map
# then use proj to get it into the tiger region
v.proj location=nj_ll mapset=PERMANENT input=$map 
g.region vector=New_Jersey_Boundary@Essex
d.mon start=wx2 resolution=2
d.vect map=$map
db.describe -c table=$map
db.select sql=`"select FType,FCode,Name from NJStructurePoints where Name like `'%Prison%`'  `"
db.select sql=`"select FType,FCode,Name from NJStructurePoints where FCode=74036  `"
########  prisons ###############
d.vect map=$map where=`"FCode=74036`"  type=point icon=basic/circle size=20 fill_color=none color=red
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170
##############  race with prisons
$map='NJ2010CensusBlock'
g.region vector=$map
v.colors --verbose map=$map color=pctblack use=attr column=PCT_BLACK
d.mon start=wx2 resolution=2
Start-Sleep -s 15_
d.vect map=$map type=area color=none
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170
d.vect map=NJStructurePoints where=`"FCode=74036`"  type=point icon=basic/circle size=20 fill_color=none color=red
d.legend -t raster=NJ2010CensusTractEssexPctBlk units=% range=0,.8 fontsize=10 at=50,99,34,35

db.select sql=`"select FType,FCode,Name from NJStructurePoints where FCode=74036 and Name not like `'%Juvenile%`' and Name not like `'%Youth%`' `"
d.vect map=NJStructurePoints where=`"FCode=74036`"  type=point icon=basic/circle size=20 fill_color=none color=100:100:100

v.extract input=NJStructurePoints output=NJAdultPrisons where=`"FCode=74036 and Name not like `'%Juvenile%`' and Name not like `'%Youth%`' `"

d.vect map=NJAdultPrisons type=point icon=basic/circle size=20 fill_color=none color=black label_color=50:50:50 attribute_column=Name

d.where -d at=433211.584962,284217.125437
#############################  pluralities NJ
$map='NJ2010CensusBlock'
v.extract input=$map output=$map"WhitePlurality" where=`"PCT_WHITE `> PCT_BLACK and PCT_WHITE `> PCT_ASIAN and PCT_WHITE `> PCT_HISPANIC`"
v.extract input=$map output=$map"BlackPlurality" where=`"TOT_POP `> 10 and PCT_BLACK `> PCT_WHITE and PCT_BLACK `> PCT_ASIAN and PCT_BLACK `> PCT_HISPANIC`" --overwrite
v.extract input=$map output=$map"AsianPlurality" where=`"TOT_POP `> 10 and PCT_ASIAN `> PCT_BLACK and PCT_ASIAN `> PCT_WHITE and PCT_ASIAN `> PCT_HISPANIC`"  --overwrite
v.extract input=$map output=$map"HispanicPlurality" where=`"TOT_POP `> 10 and PCT_HISPANIC `> PCT_BLACK and PCT_HISPANIC `> PCT_WHITE and PCT_HISPANIC `> PCT_ASIAN`" --overwrite
v.colors --verbose map=$map"WhitePlurality" color=pctwhite use=attr column=PCT_WHITE
v.colors --verbose map=$map"BlackPlurality" color=pctblack use=attr column=PCT_BLACK
v.colors --verbose map=$map"AsianPlurality" color=pctasian use=attr column=PCT_ASIAN
v.colors --verbose map=$map"HispanicPlurality" color=pcthispanic use=attr column=PCT_HISPANIC
d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map"BlackPlurality" type=area color=none
d.vect map=$map"AsianPlurality" type=area color=none
d.vect map=$map"HispanicPlurality" type=area color=none
d.vect map=$map"WhitePlurality" type=area color=none
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=118:178:201
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=100" width=1 color=118:178:201
d.vect map=New_Jersey_Counties@Essex type=boundary width=1 color=170:170:170

################  pluralities Essex
$map='NJ2010CensusBlockEssex'
g.region vector=$map
v.extract input=$map output=$map"WhitePlurality" where=`"TOT_POP `> 10 and PCT_WHITE `> PCT_BLACK and PCT_WHITE `> PCT_ASIAN and PCT_WHITE `> PCT_HISPANIC`"
v.extract input=$map output=$map"BlackPlurality" where=`"TOT_POP `> 10 and PCT_BLACK `> PCT_WHITE and PCT_BLACK `> PCT_ASIAN and PCT_BLACK `> PCT_HISPANIC`" 
v.extract input=$map output=$map"AsianPlurality" where=`"TOT_POP `> 10 and PCT_ASIAN `> PCT_BLACK and PCT_ASIAN `> PCT_WHITE and PCT_ASIAN `> PCT_HISPANIC`"
v.extract input=$map output=$map"HispanicPlurality" where=`"TOT_POP `> 10 and PCT_HISPANIC `> PCT_BLACK and PCT_HISPANIC `> PCT_WHITE and PCT_HISPANIC `> PCT_ASIAN`"
v.colors --verbose map=$map"WhitePlurality" color=pctwhite use=attr column=PCT_WHITE
v.colors --verbose map=$map"BlackPlurality" color=pctblack use=attr column=PCT_BLACK
v.colors --verbose map=$map"AsianPlurality" color=pctasian use=attr column=PCT_ASIAN
v.colors --verbose map=$map"HispanicPlurality" color=pcthispanic use=attr column=PCT_HISPANIC
d.mon start=wx2 resolution=2
Start-Sleep -s 15
d.vect map=$map"BlackPlurality" type=area color=none
d.vect map=$map"AsianPlurality" type=area color=none
d.vect map=$map"HispanicPlurality" type=area color=none
d.vect map=$map"WhitePlurality" type=area color=none
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=1.5 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=0.75 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=EssexMunicipalities@Essex type=boundary width=1 color=150:150:150
d.vect map=EssexCounty@Essex type=boundary width=1.5 color=black
##################  rivers #################
$shp='C:\gis\data\nj\stateriv\stateriv.shp'
$map='NJRivers'
## do this in new region nj_ll
v.in.ogr input=$shp output=$map -o --overwrite --verbose columns=cat,FNODE_,TNODE_,LPOLY_,RPOLY_,LENGTH,STATERIV_,STATERIV_I,MODULE,ORDER_,LEVEL,NUMBER,NAME,DIREC
TION,PERIODICIT,SITUATION,REACH,REGION,S_REGION,A_UNIT,C_UNIT,UNIQUE_
g.region vector=New_Jersey_Boundary@Essex
d.mon start=wx2 resolution=2
d.vect map=NJRivers
db.describe -c table=$map
