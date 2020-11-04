$shp='C:\gis\data\nj\stateriv\stateriv.shp'
$map='NJRivers'
#g.region -a vector=New_Jersey_Boundary@Essex
g.region -a vector=NJRivers@Essex
d.mon start=wx2 resolution=2
# wait for display
start-sleep -seconds 4
d.vect map=NJRivers
#db.describe -c table=$map

d.vect map=EssexUseParcels where="USE=153" color="0:255:0"