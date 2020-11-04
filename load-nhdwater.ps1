# https://gisdata-njdep.opendata.arcgis.com/datasets/national-hydrography-dataset-nhd-waterbody-2002-for-new-jersey-download
$shp='C:\gis\data\nj\NHDWaterbody_2002_shapefile\NHDWaterbody_2002.shp'
$map='NHDWater'
g.region vector=New_Jersey_Boundary@Essex
v.in.ogr input=$shp output=$map -o -r
g.region vector=$map
d.mon start=wx2 resolution=2
start-sleep -seconds 5
d.vect map=$map