import os

OS_API_KEY = os.getenv('OSKEY')
EANDATA_BARCODE_API_KEY = os.getenv('EANDATA_KEY')
EANDATA_BARCODE_API_ENDPOINT = "https://eandata.com/feed/?v=3&keycode={EANDATA_BARCODE_API_KEY}&mode=json&find="
UPCITEMDB_BARCODE_API_ENDPOINT = "https://api.upcitemdb.com/prod/trial/lookup?upc="


