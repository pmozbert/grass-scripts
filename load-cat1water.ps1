$shp='C:\gis\data\nj\Category_One__C1__Waters_of_New_Jersey-shp\Category_One__C1__Waters_of_New_Jersey.shp'
$map='NJCat1Water'
v.in.ogr input=$shp output=$map -o
g.region vector=$map
d.mon start=wx2 resolution=2
start-sleep -seconds 5
d.vect map=$map