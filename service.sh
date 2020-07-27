rm -rf /opt/smokeping/var/*
./opt/smokeping/bin/smokeping --config=/opt/smokeping/etc/config --logfile=smoke.log >> null

rm -rf /run/httpd/* /tmp/httpd*
exec /usr/sbin/apachectl -DFOREGROUND >> null
#/usr/sbin/httpd -k start 2> null
