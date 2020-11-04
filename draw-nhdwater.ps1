<#
# https://gisdata-njdep.opendata.arcgis.com/datasets/national-hydrography-dataset-nhd-waterbody-2002-for-new-jersey-download

db.describe -c table=$map
Column 1: cat:INTEGER:20
Column 2: COMID:INTEGER:20
Column 3: PERMANENT_:CHARACTER:40
Column 4: FDATE:DATE:20
Column 5: RESOLUTION:INTEGER:20
Column 6: GNIS_ID:CHARACTER:10
Column 7: GNIS_NAME:CHARACTER:65
Column 8: AREASQKM:DOUBLE PRECISION:20
Column 9: ELEVATION:DOUBLE PRECISION:20
Column 10: REACHCODE:CHARACTER:14
Column 11: FTYPE:INTEGER:20
Column 12: FCODE:INTEGER:20
Column 13: FTYPE_DESC:CHARACTER:50
Column 14: FCODE_DESC:CHARACTER:254
Column 15: SHAPE_Leng:DOUBLE PRECISION:20
Column 16: SHAPE_Area:DOUBLE PRECISION:20

db.select sql="select DISTINCT FCODE,FCODE_DESC from $map"
FCODE|FCODE_DESC
33600|Canal/Ditch
46006|Stream/River: Hydrographic Category = Perennial
46000|Stream/River
44500|Sea/Ocean
45500|Spillway
39004|Lake/Pond: Hydrographic Category = Perennial
39009|Lake/Pond: Hydrographic Category = Perennial; Stage = Average Water Elevation
39010|Lake/Pond: Hydrographic Category = Perennial; Stage = Normal Pool
43601|Reservoir: Reservoir Type = Aquaculture
43624|Reservoir; Reservoir Type = Treatment
43600|Reservoir
43613|Reservoir: Reservoir Type = Water Storage; Construction Material = Nonearthen
39001|Lake/Pond: Hydrographic Category = Intermittent
49300|Estuary
43603|Reservoir: Reservoir Type = Decorative Pool
43611|Reservoir: Reservoir Type = Settling Pond
39011|Lake/Pond: Hydrographic Category = Perennial; Stage = Date of Photography
39005|Lake/Pond: Hydrographic Category = Intermittent; Stage = High Water Elevation
43625|Reservoir: Reservoir Type = Disposal; Construction Material = Earthen
39000|Lake/Pond

PS C:\gis\data\nj> db.select sql="select min(SHAPE_Area) from $map" --verbose
min(SHAPE_Area)
0.79270170711
PS C:\gis\data\nj> db.select sql="select max(SHAPE_Area) from $map" --verbose
max(SHAPE_Area)
20864621396.2

db.select sql="select max(AREASQKM) from $map" --verbose
max(AREASQKM)
1938.588
#>
<#
problem with where in d.vect
Hi, I have a problem with select in d.vect
This works.
d.vect map=$map where="FCODE=39004" width=1

And this works.
d.vect map=$map where="AREASQKM > 2" width=1

But when I do this, I get this error.
d.vect map=$map where="FCODE=39004 AND AREASQKM > 2" width=1
#>

$map='NHDWater'
g.region vector=New_Jersey_Boundary@Essex
d.mon start=wx3 resolution=2
start-sleep -seconds 10
# draw reserviors
d.vect map=$map where="FCODE IN (43600,43613)" width=1 color=16:138:179
d.vect map=$map where="FCODE=43613" width=1 color=16:138:179
d.vect map=$map where="FCODE=43624" width=1 color=16:138:179
d.vect map=$map where="FCODE=43625" width=1 color=16:138:179

# draw lakes
d.vect map=$map where="FCODE=39000" width=1 color=117:187:199

# draw pernnial lakes
d.vect map=$map where="FCODE=39004 and AREASQKM > 2" width=1 color=black
d.vect map=$map where="FCODE=39009" width=1 color=117:187:199
d.vect map=$map where="FCODE=39010" width=1 color=117:187:199
d.vect map=$map where="FCODE=39001" width=1 color=117:187:199
d.vect map=$map where="FCODE=39011" width=1 color=117:187:199
d.vect map=$map where="FCODE=39005" width=1 color=117:187:199

# draw river and streams
d.vect map=$map where="FCODE=46000" width=1 color=66:135:245
d.vect map=$map where="FCODE=46006" width=1 color=66:135:245

# draw canals
d.vect map=$map where="FCODE=33600" width=1 color=83:64:247

# draw estuary
d.vect map=$map where="FCODE=49300" width=1 color=138:145:138 fill_color=174:189:174

# draw other rivers dataset
d.vect map=NJRivers width=1 color=66:135:245

d.vect map=New_Jersey_Boundary@Essex type=boundary color=200:200:200 width=1
