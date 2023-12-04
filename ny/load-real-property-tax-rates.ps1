# load json data into db
# first download the data with download-real-property-tax-rates.py
# https://grass.osgeo.org/grass83/manuals/db.in.ogr.html
$datafile = 'C:\Users\pmolz\gis\data\ny\Real_Property_Tax_Rates_Levy_Data_By_Municipality__Beginning_2004.csv'
db.in.ogr input=$datafile output=real_property_tax_rates --overwrite
db.describe -c real_property_tax_rates

# ncols: 16
# nrows: 55598
# Column 1: Fiscal_Year_Ending:INTEGER:20
# Column 2: Roll_Year:INTEGER:20
# Column 3: Swis_Code:TEXT:1000
# Column 4: Municipality:TEXT:1000
# Column 5: County:TEXT:1000
# Column 6: School_Code:TEXT:1000
# Column 7: School_Name:TEXT:1000
# Column 8: Type_of_Value_on_which_Tax_Rates_are_applied:TEXT:1000
# Column 9: County_Tax_Levy:DOUBLE PRECISION:20
# Column 10: County_Tax_Rate_Outside_Village__per__1000_value_:DOUBLE PRECISION:20
# Column 11: County_Tax_Rate_Inside_Village__per__1000_value_:DOUBLE PRECISION:20
# Column 12: Municipality_Tax_Levy:DOUBLE PRECISION:20
# Column 13: Municipal_Tax_Rate_Outside_Village__per__1000_value_:DOUBLE PRECISION:20
# Column 14: Municipal_Tax_Rate_Inside_Village__per__1000_value_:DOUBLE PRECISION:20
# Column 15: School_District_Tax_Levy:DOUBLE PRECISION:20
# Column 16: School_District_Tax_Rate__per__1000_value_:DOUBLE PRECISION:20
