import requests
import config


# Identify company name from barcode via API call.
class BarcodeCompany:
    def __init__(self, barcode):
        self.barcode = barcode
    
    # Should this be recursive instead?
    # TODO: Figure out what to return and if to send any error messages.  
    # TODO: Add logging. 
    def get_barcode_company_data (self):
      r = requests.get(config.EANDATA_BARCODE_API_ENDPOINT + self.barcode).json()
      company = r.get("company")
      if company:
        return company.get("name")
      # TODO: Check another database for barcode.
      # company_name is set to None when response lacks company name.
      return None


# Tests if barcode to company.
# Uses Thayer Witch Hazel.
thayer_witch_hazel_barcode = "041507070066"
barcode_test = BarcodeCompany(thayer_witch_hazel_barcode)
if barcode_test.get_barcode_company_data() == "Thayer":
  print("Barcode to company test passing!")
else:
  print("Barcode to company test failing!")