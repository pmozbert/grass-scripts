<#
# describe map
db.describe -c table=WarrenCountyParcels
v.info map=WarrenLandUseParcels
# see layers
v.category input=WarrenCountyParcels option=report
v.category input=WarrenLandUseParcels option=report
# see db connection
v.db.connect -p map=WarrenCountyParcels
v.db.connect -p map=WarrenLandUseParcels
#>

$maps = db.tables | where-object {$_ -match 'CountyParcels'}
g.region vector=New_Jersey_Boundary
foreach($map in $maps){
	$isMatch = $map -match '(\w+)CountyParcels$'
	if(! $isMatch){continue}
    $county = $matches[1]
    $outtable = "$($county)PublicLandUseParcels" 
	write-host extract land use boundaries from $map to $outtable 
   v.extract  --verbose input=$map where=`"USE is 2`"  output=$count$outtable
   write-host dissolving land use boundaries in $outtable 
   v.dissolve --verbose input=$outtable column=USE output=$outtable --overwrite
   #v.colors --verbose map=$outtable rules=parceluse.color.rules.txt  use=attr column=USE layer=1
}

<#
g.region vector=WarrenLandUseParcels
d.vect map=WarrenLandUseParcels
#>