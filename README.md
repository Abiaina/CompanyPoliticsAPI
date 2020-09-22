See https://github.com/Abiaina/PeoplePowerProductToPolitics/tree/master/ProductToPolitics


Last reconfigured API to use Python3 and containerized it using Docker on 4/5/2020.

API that takes barcode numbers and returns the company that owns this product.

Implemented with Python 3.7.4, Flask, and [external database][data-sources) .

## Example Usage - Product To Politics App
Scan any product's barcode to learn about the political implications of your purchases.
![Product To Politics App](P2P.gif)


## Run Locally
1. `pip install -r requirements.txt`
1. `python src/api.py`
1. Visit API's Homepage on http://127.0.0.1:5000/ .
1. Post to API for political data, run `curl -X POST "http://127.0.0.1:5000/api/v2/get_politics"`

## Run in Docker Locally
1. docker build .
1. docker run -p 5000:5000 -i <name of image created above>
1. Visit API's Homepage on `http://0.0.0.0:5000/` .
1. Post to API for political data, run `curl -X POST "http://0.0.0.0:5000/api/v2/get_politics"`

## Configurations, Keys and Environment
Get API keys and store them as environment variables. The config file expects OSKEY for Open Secrets API Key.

# Data Sources
## Company Financial Political Data Source
### Open Secrets Api

Open Secrets API provided the financial-political actions of any large corporations. Reach out to apis@crp.org directly or ask questions in the group: opensecrets-open-data@googlegroups.com. Learn more here: https://www.opensecrets.org/resources/datadictionary/UserGuide.pdf .

## Company Barcode Data Source
### EANdata API
### UPC Lookup Database API