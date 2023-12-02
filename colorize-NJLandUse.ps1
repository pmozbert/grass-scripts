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
    #v.extract  --verbose input=$map  where=`"USE is 2`" output=$county"Use2Parcels"
	write-host coloring land use on $map
   v.colors  map="$($county)CountyParcels" use=attr column=USE rules=parceluse.color.rules.txt
}

<#
g.region vector=WarrenLandUseParcels
d.vect map=WarrenLandUseParcels
#>