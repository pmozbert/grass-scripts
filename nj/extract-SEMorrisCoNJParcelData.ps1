############################## SE MORRIS ############################3
CHATHAM TWP 882194 1405
LONG HILL TWP 882196 1430
HARDING TWP 882195 1413
MADISON BORO 885287 1417
CHATHAM BORO 885182 1404
v.extract --verbose input=MORRISCountyParcels where="MUN in ('1405','1430','1413','1417','1404') AND LAND_VAL IS NOT NULL" output=SEMORRISParcels
v.info map=SEMORRISParcels
g.region vector=SEMORRISParcels
v.extract input=MORRISMunicipalities where="GNIS='882194' or GNIS='882196' or GNIS='882195' or GNIS='885287' or GNIS='885182'" output=SEMORRISMuni --overwrite
v.extract -d input=SEMORRISMuni output=SEMORRISBoundary new=1 --overwrite
v.clip input=Railroads_Network clip=SEMORRISBoundary output=SEMORRISRailroads
v.extract --verbose input=Tran_road_centerline_NJ where="MUNI_L in ('882194','882196','882195','885287','885182') OR MUNI_R in ('882194','882196','882195','885287','885182')" output=SEMORRISRoads
v.extract --verbose input=SEMORRISRoads where="SYMBOLTYPE < 500" output=SEMORRISRoadsState
v.extract --verbose input=SEMORRISRoads where="SYMBOLTYPE > 499 AND SYMBOLTYPE < 700" output=SEMORRISRoadsCounty
v.extract --verbose input=SEMORRISRoads where="SYMBOLTYPE > 699" output=SEMORRISRoadsLocal
v.extract --verbose input=SEMORRISParcels output=SEMORRISUseParcels where="USE is not 2 and TAX=0" --overwrite
v.colors --verbose map=SEMORRISParcels color=tax use=attr column=TAX
v.colors --verbose map=SEMORRISUseParcels color=parceluse use=attr column=USE