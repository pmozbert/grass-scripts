$muni='Livingston'
$county='Essex'
$map=$county + $muni + 'Parcels'
$usemap = $county + $muni + 'LandUseParcels'
v.dissolve --verbose input=$map column=USE  output=$usemap 
g.region vector=$usemap
v.colors   --verbose map=$usemap     color=parceluse  use=cat
d.mon start=wx2 resolution=2
Start-Sleep -s 10
d.vect map=$usemap type=area color=none