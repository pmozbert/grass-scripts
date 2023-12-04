""" download data and save to a file
run this from outside grass because it uses requests lib
"""
import requests
import json

url = "https://data.ny.gov/resource/iq85-sdzs.json?$query=SELECT%20fiscal_year_ending%2C%20roll_year%2C%20swis_code%2C%20municipality%2C%20county%2C%20school_code%2C%20school_name%2C%20type_of_value_on_whichtax_rates_are_applied%2C%20county_tax_levy%2C%20county_tax_rate_outside_village_per_1000_assessed_value%2C%20county_tax_rate_inside_village_per_1000_assessed_value%2C%20municipality_tax_levy%2C%20municipal_tax_rate_outside_village_per_1000_assessed_value%2C%20municipal_tax_rate_inside_village_per_1000_assessed_value%2C%20school_district_tax_levy%2C%20school_district_tax_rate_per_1000_assessed_value%20ORDER%20BY%20fiscal_year_ending%20DESC%2C%20swis_code%20ASC%2C%20school_code%20ASC"
datafile = r'C:\Users\pmolz\gis\data\ny\Real_Property_Tax_Rates_Levy_Data_By_Municipality__Beginning_2004.json'

response = requests.get(url)

data = None

if response.status_code == 200:
    data = response.json()
    with open(datafile, 'w') as f:
        json.dump(data, f,indent=4)
    # print(data)
else:
    print(f"Failed to retrieve data. Error {response.status_code}: {response.reason}")

