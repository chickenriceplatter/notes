linux
===

print distribution
---
```bash
cat /etc/*-release
```

show if port is in use
---
http://stackoverflow.com/questions/9609130/quick-way-to-find-if-a-port-is-open-on-linux

centos
===

update all packages
---
```bash
yum update -y
```

switch to root user
---
```bash
sudo su -
```

check if a package is installed
---
```bash
yum list installed PACKAGE_NAME
```

install nodejs
---
```bash
sudo yum install -y nodejs npm --enablerepo=epel
```
