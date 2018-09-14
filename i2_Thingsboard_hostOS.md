Instalación de IoT Gateway
https://thingsboard.io/docs/user-guide/install/linux/
```
wget https://github.com/thingsboard/thingsboard/releases/download/v2.1/thingsboard-2.1.deb -O thingsboard.deb
sudo dpkg -i thingsboard.deb
```
```
# --loadDemo option will load demo data: users, devices, assets, rules, widgets
$ sudo /usr/share/thingsboard/bin/install/install.sh --loadDemo

$ sudo service thingsboard start
$ sudo service thingsboard status
```
Once started, you will be able to open Web UI using the following link:
```
http://localhost:8080/
cat /etc/thingsboard/conf/thingsboard.conf
```
