<#
1 1 Vacant Land 
2 2 Residential 
31 3A Farm (Regular) 
32 3B Farm (Qualified) 
41 4A Commercial 
42 4B Industrial 
43 4C Apartment 
51 5A Class I Railroad Property 
52 5B Class II Railroad Property 
61 6A Personal Property Telephone
62 6B Machinery, Apparatus or Equipment of Petroleum Refineries
151 15A Public School Property
152 15B Other School Property
153 15C Public Property
154 15D Church & Charitable Property
155 15E Cemeteries & Graveyards
156 15F Other Exempt properties not included in the above classifications
#>

# $vfldr="C:\gis\grassdata\nj\Essex\vector"
# $maps = Get-ChildItem -Directory $vfldr
$maps = g.list type=vector pattern=*PublicLand*
g.region vector=New_Jersey_Boundary
d.mon start=wx2 resolution=2
Start-Sleep -s 10
foreach($map in $maps){
	$isMatch = $map -match '(\w+)PublicLandUseParcels$'
	if(! $isMatch){continue}
	$county = $matches[1]
	write-host $county
	d.vect map=$map type=area color=none fill_color=208:226:213
}
