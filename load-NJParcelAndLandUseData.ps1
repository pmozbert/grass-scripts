$datafldr = 'c:\gis\data\nj\parcels'
$f = Get-ChildItem -Directory $datafldr
foreach($fldr in $f){
	$fldr.Name -match 'parcels_shp_dbf_(\w+)'
	$county = $matches[1]
	$ctyfldr = Join-Path $datafldr $fldr
	$map = $county + "CountyParcels"
	$taxdb = $county + "CountyTaxList"
	$shp = Join-Path $ctyfldr $map".shp"
	$tx = Join-Path $ctyfldr $taxdb".dbf"
	
	v.in.ogr input=$shp output=$map snap=1e-009
	db.in.ogr input=$tx output=$taxdb
}

$datafldr = 'c:\gis\data\nj\parcels'
$f = Get-ChildItem -Directory $datafldr
foreach($fldr in $f){
	$fldr.Name -match 'parcels_shp_dbf_(\w+)'
	$county = $matches[1]
	
	if($county -eq 'Atlantic') {
		#write-host skipping $county
		#continue
	}
	$cntyname=$county+"County"
	$ucnty = $county.ToUpper()
	if($ucnty -eq "CAPEMAY"){$ucnty = "CAPE MAY"}
	$ctyfldr = Join-Path $datafldr $fldr
	$map = $county + "CountyParcels"
	$taxdb = $county + "CountyTaxList"

	write-host creating indexes
	db.execute sql="`"create index "$county"_pams_ind on "$map"`(PAMS_PIN`)`""
	db.execute sql="`"create index "$county"_gis_ind on "$taxdb"`(GIS_PIN`)`""
	
	write-host join $map to $taxdb and add columns
	v.db.join --verbose map=$map column=PAMS_PIN other_table=$taxdb other_column=GIS_PIN
	v.db.addcolumn map=$map columns=`"TAX double precision`"
	v.db.addcolumn map=$map columns=`"LAND_VAL_PER_ACRE double precision`"
	v.db.addcolumn map=$map columns=`"NET_VAL_PER_ACRE double precision`"
	v.db.addcolumn map=$map columns=`"TAX_PER_ACRE double precision`"
	v.db.addcolumn map=$map columns=`"USE INT`"
	v.db.update    map=$map col=TAX qcol=`"CAST`(LAST_YR_TX as decimal`)`"
	
	write-host add use data to $map
	db.execute sql=`"update "$map" SET LAND_VAL_PER_ACRE = 0`"
	db.execute sql=`"update "$map" SET LAND_VAL_PER_ACRE = LAND_VAL / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE `> .05`"
	db.execute sql=`"update "$map" SET TAX_PER_ACRE = TAX / CALC_ACRE where PROP_CLASS='2' AND CALC_ACRE `> .05`"
	db.execute sql=`"update "$map" SET NET_VAL_PER_ACRE = NET_VALUE / CALC_ACRE where PROP_CLASS=`'2`' AND CALC_ACRE `> .05`"
	db.execute sql=`"update "$map" set USE=1 where PROP_CLASS=`'1`'`"
	db.execute sql=`"update "$map" set USE=2 where PROP_CLASS=`'2`'`"
	db.execute sql=`"update "$map" set USE=31 where PROP_CLASS=`'3A`'`"
	db.execute sql=`"update "$map" set USE=32 where PROP_CLASS=`'3B`'`"
	db.execute sql=`"update "$map" set USE=41 where PROP_CLASS=`'4A`'`"
	db.execute sql=`"update "$map" set USE=42 where PROP_CLASS=`'4B`'`"
	db.execute sql=`"update "$map" set USE=43 where PROP_CLASS=`'4C`'`"
	db.execute sql=`"update "$map" set USE=51 where PROP_CLASS=`'5A`'`"
	db.execute sql=`"update "$map" set USE=52 where PROP_CLASS=`'5B`'`"
	db.execute sql=`"update "$map" set USE=61 where PROP_CLASS=`'6A`'`"
	db.execute sql=`"update "$map" set USE=62 where PROP_CLASS=`'6B`'`"
	db.execute sql=`"update "$map" set USE=151 where PROP_CLASS=`'15A`'`"
	db.execute sql=`"update "$map" set USE=152 where PROP_CLASS=`'15B`'`"
	db.execute sql=`"update "$map" set USE=153 where PROP_CLASS=`'15C`'`"
	db.execute sql=`"update "$map" set USE=154 where PROP_CLASS=`'15D`'`"
	db.execute sql=`"update "$map" set USE=155 where PROP_CLASS=`'15E`'`"
	db.execute sql=`"update "$map" set USE=156 where PROP_CLASS=`'15F`'`"
	
	write-host extracting data for $ucnty
	v.extract  --verbose input=New_Jersey_Counties        where=`"COUNTY=`'"$ucnty"`'`"       output=$cntyname
	v.extract  --verbose input=New_Jersey_Municipalities  where=`"COUNTY=`'"$ucnty"`'`"       output=$county"Municipalities"
	v.extract  --verbose input=$map                       where=`"USE is not 2 and TAX=0`"    output=$county"UseParcels"
	v.extract  --verbose input=$map                       where=`"USE is not 2 and TAX `> 0`" output=$county"NonResTaxedParcels" 
	
	write-host dissovling land use boundaries from $map to $county"LandUseParcels" 
	v.dissolve --verbose input=$map                       column=USE                          output=$county"LandUseParcels" 
	
	write-host "clipping to maps for powerlines, railroads, and roads"
	v.clip     --verbose input=NJPowerLines               clip=$cntyname                      output=$county"PowerLines"
	v.clip     --verbose input=Railroads_Network          clip=$cntyname                      output=$county"Railroads"
	v.clip     --verbose input=Tran_road_centerline_NJ    clip=$cntyname                      output=$county"Roads"

	write-host "colorizing the maps"
	v.colors   --verbose map=$map                        color=taxperacre use=attr column=TAX_PER_ACRE
	v.colors   --verbose map=$map                        color=tax        use=attr column=TAX
	v.colors   --verbose map=$county"NonResTaxedParcels" color=tax        use=attr column=TAX
	v.colors   --verbose map=$county"UseParcels"         color=parceluse  use=attr column=USE
	v.colors   --verbose map=$county"LandUseParcels"     color=parceluse  use=cat
}



