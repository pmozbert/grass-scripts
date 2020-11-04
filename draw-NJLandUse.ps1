$vfldr="C:\gis\grassdata\nj\Essex\vector"
$maps = Get-ChildItem -Directory $vfldr
g.region vector=New_Jersey_Boundary
d.mon start=wx2 resolution=2
Start-Sleep -s 10
foreach($mapfile in $maps){
	$isMatch = $mapfile.Name -match '(\w+)County$'
	if(! $isMatch){continue}
	$county = $matches[1]
	write-host $county
	d.vect map=$county"LandUseParcels" type=area color=none
}
