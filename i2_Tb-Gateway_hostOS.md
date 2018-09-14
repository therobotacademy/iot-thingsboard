Instalación de IoT Gateway
https://thingsboard.io/docs/iot-gateway/install/linux/
```
$ wget https://github.com/thingsboard/thingsboard-gateway/releases/download/v1.4.0.1/tb-gateway-1.4.0.deb
```
```
$ sudo dpkg -i tb-gateway-1.4.0.deb
$ sudo service tb-gateway start
$ sudo service tb-gateway status
```
Lo conectamos a la instancia de Thingsboard. Si está en la misma máquina el host puede ser ‘localhost’:
```
$ sudo nano /etc/tb-gateway/conf/tb-gateway.yml
```
```
gateway.remoteConfiguration: true

extensions
   -
        id: "mqtt-aws"
        type: "MQTT"
        extensionConfiguration: mqtt-config.json
        mqtt.enabled : true
        mqtt.configuration : <file path>
```

Después de la edición de este fichero:
```
$ sudo service tb-gateway restart
cat /etc/tb-gateway/conf/tb-gateway.yml
```
