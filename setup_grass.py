import os
import sys

def setup():
    grassdata = r"C:\Users\pmolz\gis\grassdata/"
    location = "usa84"
    mapset = "PERMANENT"
    gisbase = r"C:\Program Files\GRASS GIS 8.3"
    grassbin = fr"{gisbase}\etc\grass83.py"
    grasslib = fr"{gisbase}\lib"
    projshare = fr"{gisbase}\share\proj"
    gdaldata = fr"{gisbase}\share\gdal"
    fontconf = fr"{gisbase}\etc\fonts.conf"
    grass = fr"{gisbase}\grass83.bat"
    packages = fr"{gisbase}\etc\python"
    sitelib = fr"{gisbase}\Python39\Lib\site-packages"
    os.environ['GISBASE'] = gisbase
    os.environ['GRASSBIN'] = grassbin
    os.environ['GDAL_DATA'] = gdaldata
    os.environ['GRASS_PROJSHARE'] = projshare
    os.environ['PROJ_LIB'] = projshare
    os.environ['FONTCONFIG_FILE'] = fontconf
    os.environ['GRASS_PAGER'] = 'more'
    os.environ["GRASS_GNUPLOT"] = "gnuplot -persist"
    os.environ["GRASS_HTML_BROWSER"] = "start"
    os.environ["HOME"] = r"C:\Users\pmolz"

    # Python path: we ask GRASS GIS where its Python packages are
    sys.path.append(packages)
    sys.path.append(sitelib)
    # sys.path.append(grasslib)


    # Import GRASS Python bindings
    import grass.script as gs
    import grass.script.setup as gsetup

    # Start GRASS Session
    session = gsetup.init(grassdata, location, mapset)

    # show current GRASS GIS settings
    print(gs.read_command("g.gisenv"))


    
    return session

def main():
# display some lines
    setup()

if __name__ == "__main__": main()