# Stop the services and disable
```
$ sudo service thingsboard stop
$ sudo systemctl disable thingsboard
```
`disable` does not stop the service. It requires a reboot (instead do the `stop`)
```
$ sudo service tb-gateway stop
$ sudo systemctl disable thingsboard
```

# Remove the installed packages
Check for the packages to remove:

```
$ dpkg --list | grep thingsboard
$ dpkg --list | grep tb-gateway

$ dpkg --remove thingsboard tb-gateway
```