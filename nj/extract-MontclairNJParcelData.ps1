###################  MONTCLAIR #######################################################
v.extract --verbose input=EssexCountyParcels where="MUN='0713'" output=EssexMontclairParcels --overwrite
g.region vector=EssexMontclairParcels
v.extract --verbose input=Tran_road_centerline_NJ@Essex where="MUNI_L='1729720' OR MUNI_R='1729720'" output=EssexMontclairRoads
v.extract --verbose input=EssexMontclairRoads@Essex where="SYMBOLTYPE < 500" output=MontclairRoadsState
v.extract --verbose input=EssexMontclairRoads@Essex where="SYMBOLTYPE > 499 AND SYMBOLTYPE < 700" output=MontclairRoadsCounty
v.extract --verbose input=EssexMontclairRoads@Essex where="SYMBOLTYPE > 699" output=MontclairRoadsLocal
v.db.join --verbose map=EssexMontclairParcels column=PAMS_PIN other_table=EssexCountyTaxList other_column=GIS_PIN

v.extract input=EssexMunicipalities where="GNIS=1729720" output=MontclairBoundary
v.clip input=Railroads_Network clip=MontclairBoundary output=MontclairRailroads
v.extract --verbose input=EssexMontclairParcels output=EssexMontclairOtherParcels where="PROP_CLASS not in ('2','4A','4B','4C')"
v.db.addcolumn map=EssexMontclairOtherParcels columns="USE INT"
db.execute sql="update EssexMontclairOtherParcels set USE=1 where PROP_CLASS='1'"
db.execute sql="update EssexMontclairOtherParcels set USE=3 where PROP_CLASS in ('3A','3B')"
db.execute sql="update EssexMontclairOtherParcels set USE=5 where PROP_CLASS in ('5A','5B')"
db.execute sql="update EssexMontclairOtherParcels set USE=6 where PROP_CLASS in ('6A','6B')"
db.execute sql="update EssexMontclairOtherParcels set USE=15 where PROP_CLASS in ('15A','15B')"
db.execute sql="update EssexMontclairOtherParcels set USE=16 where PROP_CLASS in ('15C')"
db.execute sql="update EssexMontclairOtherParcels set USE=17 where PROP_CLASS in ('15D','15E')"
db.execute sql="update EssexMontclairOtherParcels set USE=18 where PROP_CLASS in ('15F')"
v.colors --verbose map=EssexMontclairOtherParcels color=parceluse use=attr column=USE
v.colors --verbose map=EssexMontclairParcels color=tax use=attr column=TAX
d.vect.thematic -l -n map=EssexMontclairOtherParcels column=USE algorithm=int nclasses=8 colors=144:158:55,73:191:26,116:124:112,116:124:112,190:106:232,109:166:232,226:13:130,83:244:244
v.to.rast input=EssexMontclairParcels output=EssexMontclairParcels type=area use=attr attribute_column=TAX
r.colors map=EssexMontclairParcels color=tax