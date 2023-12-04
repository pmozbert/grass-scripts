$map = 'NYS_Civil_Boundaries'
$layer = 'Cities_Towns'
g.region -a vector=$map

# v.db.join --verbose map=$map column=SWIS other_table=real_property_tax_rates other_column=Swis_Code

d.mon start=wx2 resolution=2
# wait for display
start-sleep -seconds 4
d.vect map=$map type=boundary color=black layer=$layer
v.colors --verbose map=$map layer=$layer color=gyr use=attr column=Municipality_Tax_Levy