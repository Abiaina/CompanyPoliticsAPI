import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Homepage of API.
@app.route('/', methods=['GET'])
def home():
    return "<h1>Know Your Consumer Power</h1><p>API that takes a product barcode and returns poltical activities of the parent company of this product. Political activity: lobbying dollars, top politician recipients, company share holders that hold office, most lobbied bill and its description, company's Open Secret's ID, and product's image URL.</p>"

# A route to return the political activities of product's parent company.
# TODO: Connect to a database.
@app.route('/api/v2/get_politics', methods=['POST'])
def api_get_politics():
    return "<h1>Product Politics API</h1>"

app.run()


