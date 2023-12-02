##################### DISPLAY LIVINGSTON ########################################
g.region vector=EssexLivingstonParcels
d.mon start=wx2 resolution=2

d.legend.vect input=c:\gis\data\nj\livingston_landuselegend.txt --verbose
d.legend -t -l raster=EssexLivingstonParcels units=$ range=1000,967860 fontsize=10

d.vect map=EssexLivingstonParcels@Essex
d.vect map=EssexLivingstonResParcels@Essex
d.vect map=EssexLivingstonOtherParcels@Essex
d.vect map=EssexLivingstonNoOwner fill_color=white
d.vect map=LivingstonRoadsLocal@Essex type=line color=128:64:64 fill_color=128:0:0 width=1
d.vect map=LivingstonRoadsCounty@Essex type=line color=37:79:145 fill_color=128:0:0 width=1
d.vect map=LivingstonRoadsState@Essex type=line color=15:96:11 fill_color=216:199:10 width=2
d.vect map=EssexMunicipalities fill_color=none width=5 where="GNIS=882219"
d.vect map=LivingstonRailroads type=line color=black width=4

v.colors --verbose map=EssexLivingstonParcels color=landvalperacre use=attr column=LAND_VAL_PER_ACRE
v.colors --verbose map=EssexLivingstonParcels color=netvalperacre use=attr column=NET_VAL_PER_ACRE
v.colors --verbose map=EssexLivingstonResParcels color=netvalperacre use=attr column=NET_VAL_PER_ACRE
v.colors --verbose map=EssexLivingstonParcels color=taxperacre use=attr column=TAX_PER_ACRE
v.colors --verbose map=EssexLivingstonOtherParcels color=parceluse use=attr column=USE
v.colors --verbose map=EssexLivingstonParcels color=tax use=attr column=TAX

d.out.file --verbose output=c:\temp\livtax format=png size=4000,4000