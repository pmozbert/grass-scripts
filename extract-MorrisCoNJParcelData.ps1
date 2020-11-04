############################## MORRIS #########################################
v.extract --verbose input=New_Jersey_Counties where="COUNTY='MORRIS'" output=MORRISCounty
v.extract --verbose input=New_Jersey_Municipalities where="COUNTY='MORRIS'" output=MORRISMunicipalities

v.clip input=Railroads_Network clip=MORRISCounty output=MORRISRailroads
v.clip input=Tran_road_centerline_NJ clip=MORRISCounty output=MORRISRoads

g.region vector=MORRISCounty
d.vect map=MORRISMunicipalities

v.in.ogr input=C:\gis\data\nj\MORRIS\parcels_shp_dbf_MORRIS\MorrisCountyParcels.shp output=MORRISCountyParcels snap=1e-009
db.in.ogr input=C:\gis\data\nj\MORRIS\parcels_shp_dbf_MORRIS\MorrisCountyTaxList.dbf output=MORRISCountyTaxList

db.execute sql="create index morris_pams_ind on MORRISCountyParcels(PAMS_PIN)"
db.execute sql="create index morris_gis_ind on MORRISCountyTaxList(GIS_PIN)"
v.db.join --verbose map=MORRISCountyParcels column=PAMS_PIN other_table=MORRISCountyTaxList other_column=GIS_PIN
v.db.addcolumn map=MORRISCountyParcels columns="TAX double precision"
v.db.update MORRISCountyParcels col=TAX qcol="CAST(LAST_YR_TX as decimal)"

v.db.addcolumn map=MORRISCountyParcels columns="LAND_VAL_PER_ACRE double precision"
v.db.addcolumn map=MORRISCountyParcels columns="NET_VAL_PER_ACRE double precision"
v.db.addcolumn map=MORRISCountyParcels columns="TAX_PER_ACRE double precision"
v.db.addcolumn map=MORRISCountyParcels columns="USE INT"
db.execute sql="update MORRISCountyParcels SET LAND_VAL_PER_ACRE = 0"
db.execute sql="update MORRISCountyParcels SET LAND_VAL_PER_ACRE = LAND_VAL / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"
db.execute sql="update MORRISCountyParcels SET TAX_PER_ACRE = TAX / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"
db.execute sql="update MORRISCountyParcels SET NET_VAL_PER_ACRE = NET_VALUE / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE > .05"
db.execute sql="update MORRISCountyParcels set USE=1 where PROP_CLASS='1'"
db.execute sql="update MORRISCountyParcels set USE=2 where PROP_CLASS='2'"
db.execute sql="update MORRISCountyParcels set USE=31 where PROP_CLASS in ('3A')"
db.execute sql="update MORRISCountyParcels set USE=32 where PROP_CLASS in ('3B')"
db.execute sql="update MORRISCountyParcels set USE=41 where PROP_CLASS in ('4A')"
db.execute sql="update MORRISCountyParcels set USE=42 where PROP_CLASS in ('4B')"
db.execute sql="update MORRISCountyParcels set USE=43 where PROP_CLASS in ('4C')"
db.execute sql="update MORRISCountyParcels set USE=51 where PROP_CLASS in ('5A')"
db.execute sql="update MORRISCountyParcels set USE=52 where PROP_CLASS in ('5B')"
db.execute sql="update MORRISCountyParcels set USE=61 where PROP_CLASS in ('6A')"
db.execute sql="update MORRISCountyParcels set USE=62 where PROP_CLASS in ('6B')"
db.execute sql="update MORRISCountyParcels set USE=151 where PROP_CLASS in ('15A')"
db.execute sql="update MORRISCountyParcels set USE=152 where PROP_CLASS in ('15B')"
db.execute sql="update MORRISCountyParcels set USE=153 where PROP_CLASS in ('15C')"
db.execute sql="update MORRISCountyParcels set USE=154 where PROP_CLASS in ('15D')"
db.execute sql="update MORRISCountyParcels set USE=155 where PROP_CLASS in ('15E')"
db.execute sql="update MORRISCountyParcels set USE=156 where PROP_CLASS in ('15F')"