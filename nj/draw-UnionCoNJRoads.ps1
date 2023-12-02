############################## UNION #########################################
v.extract --verbose input=New_Jersey_Counties where="COUNTY='UNION'" output=UnionCounty
v.extract --verbose input=New_Jersey_Municipalities where="COUNTY='UNION'" output=UnionMunicipalities

v.clip input=Railroads_Network clip=UnionCounty output=UnionRailroads
v.clip input=Tran_road_centerline_NJ clip=UnionCounty output=UnionRoads

g.region vector=UnionCounty
d.vect map=UnionMunicipalities