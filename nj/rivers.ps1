$shp='C:\gis\data\nj\stateriv\stateriv.shp'
$map='NJRivers'
## do this in new region nj_ll
v.in.ogr input=$shp output=$map -o --overwrite columns=cat,FNODE_,TNODE_,LPOLY_,RPOLY_,LENGTH,STATERIV_,STATERIV_I,MODULE,ORDER_,LEVEL,NUMBER,NAME,DIRECTION,PERIODICIT,SITUATION,REACH,REGION,S_REGION,A_UNIT,C_UNIT,UNIQUE_
g.region vector=New_Jersey_Boundary@Essex
d.mon start=wx2 resolution=2
d.vect map=NJRivers
db.describe -c table=$map