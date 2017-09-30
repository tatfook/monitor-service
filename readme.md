# monitor-service

monitor our own servers

## nagios

```bash
git clone https://github.com/tatfook/monitor-service
cd monitor-service

###################################
server: https://hub.docker.com/r/quantumobject/docker-nagios/
###################################

# pull nagios server image
docker pull quantumobject/docker-nagios

# run nagios server
docker run --name=nagios -d \
       -p 25 -p 32770:80 \
       -v $(pwd)/nagios-etc:/usr/local/nagios/etc \
       quantumobject/docker-nagios

# visit nagios
#http://localhost:32770/nagios

# check cfg file
docker exec nagios /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

# check nrpe
docker exec nagios /usr/local/nagios/libexec/check_nrpe -H 121.14.117.251 -c "check_users"

# restart
docker restart nagios

###################################
# nrpe-client: https://hub.docker.com/r/totem/docker-nrpe/
###################################

# pull image
docker pull totem/docker-nrpe

# it need privilege
docker run --privileged --name=nrpe -d \
       -p 5666:5666 \
       -v /:/mnt/ROOT \
       -v $(pwd)/nrpe-etc:/etc/nagios \
       totem/docker-nrpe
```
