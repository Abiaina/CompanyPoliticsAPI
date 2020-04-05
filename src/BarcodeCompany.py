import requests
import config



# Identify company name from barcode via API call.
class BarcodeCompany:
    def __init__(self, barcode):
        self.name = barcode
    
    def _get_barcode_company_data (self):
        # TODO: Make Barcode to Company API call.
        return
         
def process_upc ():
  r = requests.get( + barcode)
  r.status_code
  r.json()
  return
  # if response["company"].nil? :
  #   response = HTTParty.get(base2 + params[:upc])
  #   data = [response["items"][0]["brand"], response["items"][0]["images"]]
  # else
  #   data = [
  #     response["company"]["name"], response["product"]["image"]
  #   ]
  
  # return data

print(config.OS_API_KEY)
