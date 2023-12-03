# notes
don't forget to get into the grass prompt before doing stuf
```pwsh
function grass-env{
	$GISBASE='C:\Program Files\GRASS GIS 8.3'
	$GRASS_PYTHON="$GISBASE\extrabin\python3.exe"
	set-env GISBASE=$GISBASE
	set-env GRASS_PYTHON=$GRASS_PYTHON
	set-env PYTHONHOME=$GISBASE\Python39
	set-env GRASS_PROJSHARE=$GISBASE\share\proj
	set-env PROJ_LIB=$GISBASE\share\proj
	set-env GDAL_DATA=$GISBASE\share\gdal
	set-env FONTCONFIG_FILE=$GISBASE\etc\fonts.conf
	add-path $GISBASE\extrabin
	add-path $GISBASE\bin
	add-path $GISBASE\Python39
	python "$($Env:GISBASE)\etc\grass83.py" --text
}

```
## municipal tax rate and levy data
 * https://data.ny.gov/Government-Finance/Real-Property-Tax-Rates-Levy-Data-By-Municipality-/iq85-sdzs
   * use export to csv
   * "C:\Users\pmolz\gis\data\ny\Real_Property_Tax_Rates_Levy_Data_By_Municipality__Beginning_2004.csv"
## state, county, municipal boundaries
 * https://gis.ny.gov/civil-boundaries
 * "C:\Users\pmolz\gis\data\ny\NYS_Civil_Boundaries.gdb"