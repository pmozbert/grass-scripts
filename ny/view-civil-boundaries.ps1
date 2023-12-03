$shp='c:\Users\pmolz\gis\data\ny\NYS_Civil_Boundaries.shp'
$map = 'NYS_Civil_Boundaries'
g.region -a vector=$map
d.mon start=wx2 resolution=2
# wait for display
start-sleep -seconds 4
d.vect map=$map