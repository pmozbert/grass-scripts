<#
v.in.ogr input=C:\gis\data\nj\Tran_road_NJ_shp\Tran_road_centerline_NJ.shp output=Tran_road_centerline_NJ
#>
$here = $PSScriptRoot

if($null -eq $Env:TMPDIR){return}

$tmpdir = (new-item -force -ItemType 'directory' -Path (join-path $Env:TMPDIR (new-guid)) -verbose).FullName
$download = 'Tran_road_NJ_shp.zip'
$map = 'Tran_road_centerline_NJ'
$zip = (join-path (join-path $here 'downloads') $download)
if(!(Test-Path $zip)){return}
Expand-Archive -Path $zip -DestinationPath $tmpdir
$shp = (Get-ChildItem -Path $tmpdir -Recurse -Filter "*.shp").FullName
v.in.ogr input=$shp output=$map
Remove-Item $tmpdir -verbose -recurse

