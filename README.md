See https://github.com/Abiaina/PeoplePowerProductToPolitics/tree/master/ProductToPolitics


Reconfigured API to use Python3 and containerized it using Docker on 4/4/2020.

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