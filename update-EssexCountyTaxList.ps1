g.mapsets mapset=Essex operation=set

v.db.addcolumn map=EssexCountyParcels columns="TAXID INT"
db.execute sql="alter table EssexCountyTaxList add column TAXID INT"
db.execute sql="update EssexCountyTaxList set TAXID=rowid"
db.execute sql="create index tax_ind on EssexCountyTaxList(TAXID)"
db.execute sql="create index pams_ind on EssexCountyParcels(PAMS_PIN)"

db.execute sql="UPDATE EssexCountyParcels SET TAXID=(SELECT TAXID FROM EssexCountyTaxList WHERE EssexCountyParcels.PAMS_PIN = EssexCountyTaxList.GIS_PIN)"
v.db.connect map=EssexCountyParcels table=EssexCountyTaxList key=TAXID layer=2

v.db.update map=EssexCountyParcels@Essex layer=2 column=TAX query_column="CAST(LAST_YR_TX as decimal)"
v.info map=EssexCountyParcels -c layer=2