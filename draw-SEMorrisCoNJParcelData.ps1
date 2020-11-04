

d.mon start=wx2 resolution=2
d.vect map=SEMORRISParcels
d.vect map=SEMORRISUseParcels
d.vect map=SEMORRISUseParcels type=boundary color=200:200:200 width=1
d.vect map=SEMORRISMuni type=boundary width=2 color=150:150:150
d.vect map=SEMORRISBoundary type=boundary width=2 color=black
d.vect map=SEMORRISRoadsState width=3 color=50:61:186
d.vect map=SEMORRISRoadsState width=1 color=206:208:232
d.vect map=SEMORRISRoadsCounty width=1 color=85:181:104
d.vect map=SEMORRISRailroads width=4 color=99:45:1
d.vect map=SEMORRISRailroads width=2 color=237:178:130
d.legend.vect input=c:\gis\data\nj\landuselegend.txt at=70,45
