g.gisenv set="DEBUG=0"
g.region vector=WESSEXParcels
d.mon start=wx2 resolution=2
d.erase
d.vect map=WESSEXParcels where="USE=2"
d.vect map=WESSEXNonResTaxedParcels
d.vect map=WESSEXUseParcels
d.vect map=WESSEXUseParcels type=boundary color=200:200:200 width=1
d.vect map=WESSEXRoads where="SYMBOLTYPE=100" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=200" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=300" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=400" width=3 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=108" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=208" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=308" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=408" width=2 color=50:61:186
d.vect map=WESSEXRoads where="SYMBOLTYPE=108" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=208" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=308" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=408" width=1 color=206:208:232
d.vect map=WESSEXRoads where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=WESSEXRoads where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=WESSEXRailroads width=4 color=99:45:1
d.vect map=WESSEXRailroads width=2 color=237:178:130
d.vect map=WESSEXPowerLines width=3 color=145:145:142
d.vect map=WESSEXPowerLines width=1 color=247:238:170
d.vect map=WESSEXMuni type=boundary width=2 color=150:150:150
d.vect map=WESSEXBoundary type=boundary width=2 color=black