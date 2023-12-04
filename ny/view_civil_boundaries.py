import os
import json
from grass.pygrass.gis.region import Region

map = 'NYS_Civil_Boundaries'

reg = Region()
reg.from_vect(map)
print(reg)
print("done")