##################### LIVINGSTON #####################################################
db.select --verbose sql="SELECT OWNER_NAME,ST_ADDRESS,LAND_VAL,TAX from EssexLivingstonParcels WHEERE PROP_CLASS='2' ORDER BY TAX DESC LIMIT 50"

v.extract --verbose input=EssexCountyParcels where="MUN='0710' AND LAND_VAL IS NOT NULL" output=EssexLivingstonParcels --overwrite
v.info map=EssexLivingstonParcels
g.region vector=EssexLivingstonParcels

v.extract --verbose input=Tran_road_centerline_NJ@Essex where=MUNI_L ='882219' OR MUNI_R='882219' output=EssexLivingstonRoads
v.extract --verbose input=EssexLivingstonRoads@Essex where="SYMBOLTYPE < 500" output=LivingstonRoadsState
v.extract --verbose input=EssexLivingstonRoads@Essex where="SYMBOLTYPE > 499 AND SYMBOLTYPE < 700" output=LivingstonRoadsCounty
v.extract --verbose input=EssexLivingstonRoads@Essex where="SYMBOLTYPE > 699" output=LivingstonRoadsLocal
v.extract input=EssexMunicipalities where="GNIS=882219" output=LivingstonBoundary
v.clip input=Railroads_Network clip=LivingstonBoundary output=LivingstonRailroads

v.db.addcolumn map=EssexLivingstonOtherParcels columns="USE INT" --overwrite
db.execute sql="update EssexLivingstonOtherParcels set USE=1 where PROP_CLASS='1'"
db.execute sql="update EssexLivingstonOtherParcels set USE=2 where PROP_CLASS='2'"
db.execute sql="update EssexLivingstonOtherParcels set USE=31 where PROP_CLASS in ('3A')"
db.execute sql="update EssexLivingstonOtherParcels set USE=32 where PROP_CLASS in ('3B')"
db.execute sql="update EssexLivingstonOtherParcels set USE=41 where PROP_CLASS in ('4A')"
db.execute sql="update EssexLivingstonOtherParcels set USE=42 where PROP_CLASS in ('4B')"
db.execute sql="update EssexLivingstonOtherParcels set USE=43 where PROP_CLASS in ('4C')"
db.execute sql="update EssexLivingstonOtherParcels set USE=51 where PROP_CLASS in ('5A')"
db.execute sql="update EssexLivingstonOtherParcels set USE=52 where PROP_CLASS in ('5B')"
db.execute sql="update EssexLivingstonOtherParcels set USE=61 where PROP_CLASS in ('6A')"
db.execute sql="update EssexLivingstonOtherParcels set USE=62 where PROP_CLASS in ('6B')"
db.execute sql="update EssexLivingstonOtherParcels set USE=151 where PROP_CLASS in ('15A')"
db.execute sql="update EssexLivingstonOtherParcels set USE=152 where PROP_CLASS in ('15B')"
db.execute sql="update EssexLivingstonOtherParcels set USE=153 where PROP_CLASS in ('15C')"
db.execute sql="update EssexLivingstonOtherParcels set USE=154 where PROP_CLASS in ('15D')"
db.execute sql="update EssexLivingstonOtherParcels set USE=155 where PROP_CLASS in ('15E')"
db.execute sql="update EssexLivingstonOtherParcels set USE=156 where PROP_CLASS in ('15F')"

v.extract --verbose input=EssexLivingstonParcels output=EssexLivingstonOtherParcels where="USE is not 2" --overwrite
v.extract --verbose input=EssexLivingstonParcels output=EssexLivingstonResParcels where="USE is 2" --overwrite
v.extract --verbose input=EssexLivingstonParcels output=EssexLivingstonNoOwner where="OWNER_NAME IS NULL" --overwrite
v.extract --verbose input=EssexLivingstonParcels output=EssexLivingstonNoTax where="TAX < 500" --overwrite

d.vect.thematic map=EssexLivingstonOtherParcels column=USE algorithm=int nclasses=9 colors=144:158:55,200:200:200,73:191:26,116:124:112,116:124:112,190:106:232,109:166:232,226:13:130,83:244:244
v.to.rast input=EssexLivingstonParcels output=EssexLivingstonParcels type=area use=attr attribute_column=TAX --overwrite
r.colors map=EssexLivingstonParcels color=tax
db.select sql="select max(TAX) from EssexLivingstonParcels"

v.db.addcolumn map=EssexLivingstonParcels columns="LAND_VAL_PER_ACRE double precision"
v.db.addcolumn map=EssexLivingstonParcels columns="NET_VAL_PER_ACRE double precision"
v.db.addcolumn map=EssexLivingstonParcels columns="TAX_PER_ACRE double precision"
db.execute sql="update EssexLivingstonParcels SET LAND_VAL_PER_ACRE = 0"
db.execute sql="update EssexLivingstonParcels SET LAND_VAL_PER_ACRE = LAND_VAL / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"
db.execute sql="update EssexLivingstonParcels SET TAX_PER_ACRE = TAX / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"
db.execute sql="update EssexLivingstonParcels SET NET_VAL_PER_ACRE = NET_VALUE / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"

db.select sql="select max(NET_VAL_PER_ACRE) from EssexLivingstonParcels"