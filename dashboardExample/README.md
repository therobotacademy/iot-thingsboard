Tutorial at Thingsboard official documentation: [End user IoT dashboard](https://thingsboard.io/docs/user-guide/ui/users/)

## 1. Test with emulator.js

Code available at this [gist](https://gist.githubusercontent.com/ashvayka/4735c78541cebd26f3ed3d340743c697/raw/1466bfbdd112937aa4d567cf4b0c939dc90321f2/emulator.js).
Set ```thingsboardHost``` to your server instance URL.

This code publishes:
 - Device attributes on script start
 - Device telemetry using MQTT, one data set every second

```
$ npm install mqtt
$ node emulator.js <DEVICE TOKEN>
```

Find the dashboard at AWS EC2 instance:

http://ec2-34-245-115-53.eu-west-1.compute.amazonaws.com/dashboards/0ced9ee0-c194-11e8-8ec7-d92fd207b2e0

And the dashboard at Thingsboard playground instance:
https://demo.thingsboard.io/dashboards/ada33690-c196-11e8-a04e-eb5f6cd0fada

## 2. Build dashboard for M5Stack DHT11 sensor
