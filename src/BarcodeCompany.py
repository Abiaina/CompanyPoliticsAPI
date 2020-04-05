import requests
import config



# Identify company name from barcode via API call.
class BarcodeCompany:
    def __init__(self, barcode):
        self.name = barcode
    
    def _get_barcode_company_data (self):
        # TODO: Make Barcode to Company API call.
        self._process_upc
        return
        
    # Should this be recursive instead?
    # TODO: Figure out what to return and if to send any error messages.   
    def _process_upc (self):
      r = requests.get(config.EANDATA_BARCODE_API_ENDPOINT + self.barcode)
      if r.status_code == 200:
        data = r.json()
        if len(data["items"]) > 0:
          print(data["items"][0]["brand"])
          return
      r = requests.get(config.UPCITEMDB_BARCODE_API_ENDPOINT + self.barcode)
      if r.status_code == 200:
          data = r.json()
          if len(data["items"]) > 0:
            print(data["items"][0]["brand"])
            return
      print("No matches for barcode")
      return
