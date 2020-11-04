##########################  MONTCLAIR DISPLAY ################################################
g.region vector=EssexMontclairParcels
d.mon start=wx2 resolution=2
d.legend.vect input=c:\gis\data\nj\landuselegend.txt --verbose
d.legend -t -l raster=EssexMontclairParcels units=$ range=1000,565312 fontsize=10
d.vect map=EssexMontclairParcels@Essex
d.vect map=EssexMontclairOtherParcels@Essex
d.vect map=MontclairRoadsLocal@Essex type=line color=128:64:64 fill_color=128:0:0 width=1
d.vect map=MontclairRoadsCounty@Essex type=line color=37:79:145 fill_color=128:0:0 width=3
d.vect map=MontclairRoadsState@Essex type=line color=15:96:11 fill_color=216:199:10 width=5
d.vect map=EssexMunicipalities fill_color=none width=5 where="GNIS=1729720"
d.vect map=MontclairRailroads type=line color=black width=4