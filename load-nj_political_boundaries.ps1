<#
https://njogis-newjersey.opendata.arcgis.com/datasets/municipal-boundaries-of-nj
https://njogis-newjersey.opendata.arcgis.com/datasets/county-boundaries-of-nj
#>
$here = $PSScriptRoot

if($null -eq $Env:TMPDIR){return}

$tmpdir = (new-item -force -ItemType 'directory' -Path (join-path $Env:TMPDIR (new-guid)) -verbose).FullName
$download = 'County_Boundaries_of_NJ-shp.zip'
$map = 'New_Jersey_Counties'
$zip = (join-path (join-path $here 'downloads') $download)
if(!(Test-Path $zip)){return}
Expand-Archive -Path $zip -DestinationPath $tmpdir
$shp = (Get-ChildItem -Path $tmpdir -Recurse -Filter "*.shp").FullName
v.in.ogr input=$shp output=$map
Remove-Item $tmpdir -verbose -recurse
v.extract -d input=New_Jersey_Counties output=New_Jersey_Boundary new=1 --overwrite

$tmpdir = (new-item -force -ItemType 'directory' -Path (join-path $Env:TMPDIR (new-guid)) -verbose).FullName
$download='Municipal_Boundaries_of_NJ-shp.zip'
$map='New_Jersey_Municipalities'
$zip = (join-path (join-path $here 'downloads') $download)
if(!(Test-Path $zip)){return}
Expand-Archive -Path $zip -DestinationPath $tmpdir
$shp = (Get-ChildItem -Path $tmpdir -Recurse -Filter "*.shp").FullName
v.in.ogr input=$shp output=$map
Remove-Item $tmpdir -verbose -recurse