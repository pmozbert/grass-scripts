<#
v.in.ogr input=C:\gis\data\Electric_Power_Transmission_Lines\Electric_Power_Transmission_Lines.shp output=USPowerLines location=usa84
v.proj location=usa84 mapset=PERMANENT input=USPowerLines --overwrite
v.clip input=USPowerLines clip=New_Jersey_Boundary output=NJPowerLines
#>
$here = $PSScriptRoot

if($null -eq $Env:TMPDIR){return}

$tmpdir = (new-item -force -ItemType 'directory' -Path (join-path $Env:TMPDIR (new-guid)) -verbose).FullName
$download = 'Electric_Power_Transmission_Lines.zip'
$map = 'USPowerLines'
$zip = (join-path (join-path $here 'downloads') $download)
if(!(Test-Path $zip)){return}
Expand-Archive -Path $zip -DestinationPath $tmpdir
$shp = (Get-ChildItem -Path $tmpdir -Recurse -Filter "*.shp").FullName
v.in.ogr input=$shp output=$map location=usa84
Remove-Item $tmpdir -verbose -recurse

v.proj location=usa84 mapset=PERMANENT input=$map --overwrite
v.clip input=$map clip=New_Jersey_Boundary output=NJPowerLines