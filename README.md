# Artemis E-commerse Web-Application

## Pre Build process
be fore you  deploy the application please open port 5000 on Security Group and then follow the bellow commands.

```
yum install python-pip -y
pip install Flask


```
## Set up systemctl  service

```
Clone artemis to /
chmod -R 777 /artemis
cp artemis.service   /etc/systemd/system
systemctl daemon-reload
systemctl start artemis
systemctl  status  artemis
```
