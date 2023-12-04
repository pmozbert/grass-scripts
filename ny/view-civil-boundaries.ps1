
$map = 'NYS_Civil_Boundaries'
g.region -a vector=$map
d.mon start=wx2 resolution=2
# wait for display
start-sleep -seconds 4
d.vect map=$map

# v.info map=NYS_Civil_Boundaries

# db.tables
# the suffix is the layer name, e.g. Towns, Villages, etc
# NYS_Civil_Boundaries_Cities_Towns
# NYS_Civil_Boundaries_Counties
# NYS_Civil_Boundaries_Counties_Shoreline
# NYS_Civil_Boundaries_Indian_Territories
# NYS_Civil_Boundaries_State
# NYS_Civil_Boundaries_State_Shoreline
# NYS_Civil_Boundaries_Villages
# country_boundaries

# v.info map=NYS_Civil_Boundaries -c layer=Cities_Towns
# Displaying column types/names for database connection of layer
# <Cities_Towns>:
# INTEGER|cat
# CHARACTER|NAME
# CHARACTER|MUNI_TYPE
# INTEGER|MUNITYCODE
# CHARACTER|COUNTY
# CHARACTER|GNIS_ID
# CHARACTER|FIPS_CODE
# CHARACTER|SWIS
# INTEGER|POP1990
# INTEGER|POP2000
# INTEGER|POP2010
# INTEGER|POP2020
# CHARACTER|DOS_LL
# DATE|DOSLL_DATE
# CHARACTER|MAP_SYMBOL
# DOUBLE PRECISION|CALC_SQ_MI
# DATE|DATEMOD
# DOUBLE PRECISION|Shape_Leng
# DOUBLE PRECISION|Shape_Area

# db.describe table=NYS_Civil_Boundaries_Cities_Towns
# Column 1: cat:INTEGER:20
# Column 2: NAME:CHARACTER:40
# Column 3: MUNI_TYPE:CHARACTER:4
# Column 4: MUNITYCODE:INTEGER:20
# Column 5: COUNTY:CHARACTER:50
# Column 6: GNIS_ID:CHARACTER:9
# Column 7: FIPS_CODE:CHARACTER:10
# Column 8: SWIS:CHARACTER:6
# Column 9: POP1990:INTEGER:20
# Column 10: POP2000:INTEGER:20
# Column 11: POP2010:INTEGER:20
# Column 12: POP2020:INTEGER:20
# Column 13: DOS_LL:CHARACTER:7
# Column 14: DOSLL_DATE:DATE:20
# Column 15: MAP_SYMBOL:CHARACTER:1
# Column 16: CALC_SQ_MI:DOUBLE PRECISION:20
# Column 17: DATEMOD:DATE:20
# Column 18: Shape_Leng:DOUBLE PRECISION:20
# Column 19: Shape_Area:DOUBLE PRECISION:20