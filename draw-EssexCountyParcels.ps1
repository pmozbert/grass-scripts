db.select sql="select cat,PAMS_PIN from EssexCountyParcels WHERE cat=132795"
db.select sql="select cat,GIS_PIN from EssexCountyTaxList WHERE cat=132795"

d.mon start=wx2 resolution=2
g.region vector=EssexCountyParcels
v.colors --verbose map=EssexCountyParcels color=tax use=attr column=TAX layer=2
d.vect map=EssexCountyParcels

v.to.rast input=EssexCountyParcels layer=2 output=EssexCountyParcels use=attr attribute_column=TAX memory=2000
r.colors map=EssexCountyParcels color=tax
d.rast map=EssexCountyParcels

d.vect map=EssexCountyParcels where="GNIS=882219" layer=2


d.vect.thematic -l -n map=EssexCountyParcels column=USE algorithm=int nclasses=9 colors=144:158:55,200:200:200,73:191:26,116:124:112,116:124:112,190:106:232,109:166:232,226:13:130,83:244:244


v.to.rast input=EssexCountyParcels output=EssexCountyParcels type=area use=attr attribute_column=TAX memory=3000 --overwrite
r.colors map=EssexCountyParcels color=tax