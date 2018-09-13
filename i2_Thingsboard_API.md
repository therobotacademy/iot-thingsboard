# TESTING THINGSBOARD AND ITS IoT GATEWAY

## [HTTP Device API Reference](https://thingsboard.io/docs/reference/http-api/)
Post a temperature to the Gateway
### DEMO instance - to GATEWAY telemetry
```
export ACCESS_TOKEN=CwLsqWkEujOVPICPCoa3
curl -v -X POST -d "{\"temperature\": 35}" https://demo.thingsboard.io/api/v1/$ACCESS_TOKEN/telemetry --header "Content-Type:application/json"
```
### AWS instance - to GATEWAY telemetry
```
export ACCESS_TOKEN=fP1vwik4mhUTM6zirEl6
curl -v -X POST -d "{\"temperature\": 29}" http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/api/v1/$ACCESS_TOKEN/telemetry --header "Content-Type:application/json"
```

### AWS instance - to device SN-001 telemetry
```
export ACCESS_TOKEN=nJoZhCnAXmgzhW4KQZJ3  # Device SN-001
curl -v -X POST -d "{\"temperature\": 25}" http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/api/v1/$ACCESS_TOKEN/telemetry --header "Content-Type:application/json"
```

### AWS instance - to device SN-001 attributes
```
export ACCESS_TOKEN=nJoZhCnAXmgzhW4KQZJ3
curl -v -X POST -d "{\"temperature\": 51}" \
http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/api/v1/$ACCESS_TOKEN/attributes --header "Content-Type:application/json"
```
**Get an attribute value**
```
curl -v -X GET http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/api/v1/$ACCESS_TOKEN/attributes?clientKeys=temperature
```
**Get attributes updates NO FUNCIONA BIEN, TENGO QUE COMPRENDER**
```
curl -v -X GET http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/api/v1/$ACCESS_TOKEN/attributes/updates?timeout=20000
```

## [MQTT Gateway API Reference](https://thingsboard.io/docs/reference/gateway-mqtt-api/)

##### username es el ACCESS_TOKEN del Gateway
ACCESS_TOKEN = nJoZhCnAXmgzhW4KQZJ3

Publish **attribute** data:
```
topic: v1/gateway/attributes
{"SN-001": {"temperature": 42}}
```

Publish **telemetry** data (one point and its timestamp):
```
topic: v1/gateway/telemetry
{"SN-001": [{"ts": 1483228860000,"values": {"temperature": 42}}]}
```
Several points with timestamps:
```
{"SN-001": [{"ts": 1483228800000,"values": {"temperature": 42}},{"ts": 1483228801000,"values": {"temperature": 43}}]}
```
Several devices with several points and their timestamps (el dispositivo B (con 2 atributos), que no existía, lo crea automáticamente ThingsBoard):
```
{
  "SN-001": [
    {
      "ts": 1483228800000,
      "values": {
        "temperature": 45
      }
    },
    {
      "ts": 1483228801000,
      "values": {
        "temperature": 55
      }
    }
  ],
  "Device B": [
    {
      "ts": 1483228800000,
      "values": {
        "temperature": 42,
        "humidity": 80
      }
    }
  ]
}
```
