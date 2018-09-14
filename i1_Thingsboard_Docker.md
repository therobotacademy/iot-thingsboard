In a host OS installation, thingsboard is managed as a service:
```
sudo service thingsboard start / stop / restart / status
```

https://thingsboard.io/docs/user-guide/install/docker/

Clone ThingsBoard repo and launch ```docker-compose```:
```
git clone https://github.com/thingsboard/thingsboard/

cd thingsboard/docker
```

If you have already installed ThingsBoard using docker and want to upgrade or cleanup your installation, please cleanup HSQLDB data directory
```
sudo rm -rf /home/docker/hsqldb_volume
```

If you would like to create system and demo data and to start ThingsBoard node execute next command:
```
ADD_SCHEMA_AND_SYSTEM_DATA=true ADD_DEMO_DATA=true bash -c 'docker-compose up -d tb'
```
#### Docker-Compose up
In case you would like to skip creation of system and demo data or you have already added and you only need to start ThingsBoard node then execute:
```
docker-compose up -d tb
```
Once started, you will be able to open Web UI using following link:
```
http://localhost:8080/
```
If you stop the service, you can restart with:
```
docker-compose restart tb
```
### ThingsBoard IoT Gateway --- *docker-compose* at **docker-gateway_clocsee**
$ wget https://github.com/edenb/docker-thingsboard-gateway/releases/tag/v1.4.0
docker-compose up -d


### ThingsBoard IoT Gateway --- Dockerfile at **docker-gateway_clocsee**
```
$ git clone https://github.com/thingsboard/thingsboard-gateway
$ cd docker-gateway_clocsee
```
#### Docker build & run
```
docker build -t tb-gateway:1.4.0 .
docker run --name tb-gate140 -e GATEWAY_HOST="localhost" -e GATEWAY_ACCESS_TOKEN="IgRyOQxWFdzuPxLCVK2Y" tb-gateway:1.4.0

docker build -t tb-gateway:2.0.4 .
docker run --name tb-gateway -e GATEWAY_HOST="localhost" -e GATEWAY_ACCESS_TOKEN="IgRyOQxWFdzuPxLCVK2Y" tb-gateway:2.0.4

# --restart unless-stopped
```
We have to insert hostname and gateway:
```
cat /etc/tb-gateway/conf/tb-gateway.yml
```

```
server:
  # Server bind address
  address: "0.0.0.0"
  # Server bind port
  port: "9090"

# Check new version updates parameters
updates:
  # Enable/disable updates checking.
  enabled: "${UPDATES_ENABLED:true}"

gateways:
  tenants:
    -
      label: "Tenant"
      reporting:
        interval: 60000
      persistence:
        type: file
        path: storage
        bufferSize: 1000
      connection:
        host: "${GATEWAY_HOST:localhost}"
        port: 1884 <---- 3 en 1.4.0 ---------------------------------------
        retryInterval: 3000
        maxInFlight: 1000
        security:
          accessToken: "${GATEWAY_ACCESS_TOKEN:YOUR_TOKEN}"
          remoteConfiguration: true
          extensions:
            -
              id: "http"
              type: "HTTP"
              extensionConfiguration: http-config.json
```

### Docker Compose with Thingsboard and IoT Gateway inside the same container
```
docker build -t brjapon/tb-and-gateway:2 .
docker run brjapon/tb-and-gateway:2
---
docker-compose up -d
docker exec -it tb_and_gateway bash
```

```
cat /etc/tb-gateway/conf/tb-gateway-yml
```
