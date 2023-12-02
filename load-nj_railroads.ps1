<#
https://njogis-newjersey.opendata.arcgis.com/datasets/NJDOT::railroads-network-1
v.in.ogr input=C:\gis\data\nj\Railroads_Network\Railroads_Network.shp output=Railroads_Network
#>
$here = $PSScriptRoot

if($null -eq $Env:TMPDIR){return}

$tmpdir = (new-item -force -ItemType 'directory' -Path (join-path $Env:TMPDIR (new-guid)) -verbose).FullName
$download = 'Railroads_Network.zip'
$map = 'Railroads_Network'
$zip = (join-path (join-path $here 'downloads') $download)
if(!(Test-Path $zip)){return}
Expand-Archive -Path $zip -DestinationPath $tmpdir
$shp = (Get-ChildItem -Path $tmpdir -Recurse -Filter "*.shp").FullName
v.in.ogr input=$shp output=$map
Remove-Item $tmpdir -verbose -recurse

v.clip input=$map clip=New_Jersey_Boundary output="NJ$map"