#
# makefile
# zdw, 2017-09-30 14:06
#

all:
	@echo "makefile needs your attention"

restart-nagios:
	sudo docker restart nagios

restart-nrpe:
	sudo docker restart nrpe

verify-config:
	sudo docker exec nagios /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

test-nrpe:
	sudo docker exec nagios /usr/local/nagios/libexec/check_nrpe -H 121.14.117.251 -c "check_users"
	sudo docker exec nagios /usr/local/nagios/libexec/check_nrpe -H 121.14.117.252 -c "check_users"



# vim:ft=make
#
