#################################################### ESSEX DISPLAY ###################################################
g.region vector=EssexCounty
d.mon start=wx2 resolution=2
d.erase
d.vect map=EssexCountyParcels where="USE=2"
d.vect map=EssexNonResTaxedParcels
d.vect map=EssexUseParcels
d.vect map=EssexUseParcels type=boundary color=200:200:200 width=1
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=3 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=3 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=3 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=3 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=100" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=200" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=300" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=400" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=2 color=50:61:186
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=108" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=208" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=308" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=408" width=1 color=206:208:232
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=600" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=608" width=1 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=2 color=153:198:255
d.vect map=EssexRoads@Essex where="SYMBOLTYPE=500" width=1 color=206:208:232
d.vect map=EssexRailroads@Essex width=4 color=99:45:1
d.vect map=EssexRailroads@Essex width=2 color=237:178:130
d.vect map=EssexPowerLines width=3 color=145:145:142
d.vect map=EssexPowerLines width=1 color=247:238:170
d.vect map=EssexMunicipalities type=boundary width=1 color=150:150:150
d.vect map=EssexCounty type=boundary width=2 color=black
