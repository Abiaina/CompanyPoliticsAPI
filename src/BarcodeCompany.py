
class BarcodeCompany:
    # Identify company name from barcode via API call.

    def __init__(self, barcode):
        self.name = barcode
        self._get_barcode_company_data()

    def _get_barcode_company_data (self):
        # TODO: Make OpenSecrets API call.



