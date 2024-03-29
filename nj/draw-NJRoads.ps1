<#
roads https://www.arcgis.com/sharing/rest/content/items/a845e8b133e34c6eb4da0062bedb99dc/info/metadata/metadata.xml?format=default&output=html
SYMBOLTYPE
100 Highway Authority Route
108  Highway Authority Ramp
200 Interstate
208 Interstate Ramp
300 US Highway
308 US Highway Ramp
400 State Highway
408 State Highway Ramp
500 County 500 Route
508 County 500 Ramp
600 Other County Route
608 Other County Ramp
700 Local Road
708 Local Ramp
900 Alley

ACCESSTYPE
N Non-Restricted
R Restricted
UNK Unknown
#>
g.region vector=New_Jersey_Boundary@Essex
d.mon start=wx2 resolution=2
d.erase
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=300" width=3 color=50:61:186
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=308" width=2 color=50:61:186
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=308" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=3 color=50:61:186
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=208" width=2 color=50:61:186
d.vect map=Tran_road_centerline_NJ@Essex where="SYMBOLTYPE=208" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=100" width=3 color=50:61:186
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=108" width=2 color=50:61:186
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=108" width=1 color=206:208:232
d.vect map=NJRailroads_Network width=3 color=99:45:1
d.vect map=NJRailroads_Network width=1 color=237:178:130
d.vect map=NJPowerLines width=3 color=145:145:142
d.vect map=NJPowerLines width=1 color=247:238:170
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=400" width=3 color=50:61:186
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=408" width=2 color=50:61:186
d.vect map=Tran_road_centerline_NJ where="SYMBOLTYPE=408" width=1 color=206:208:232
#d.vect map=New_Jersey_Counties type=boundary width=2 color=150:150:150
#d.vect map=New_Jersey_Boundary type=boundary width=2 color=black