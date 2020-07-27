FROM centos:8

MAINTAINER khinpyaephyosan@gmail.com

COPY config /etc/selinux/

RUN yum install epel-release -y
RUN yum groupinstall "Development tools" -y
RUN yum install perl httpd httpd-devel mod_fcgid rrdtool perl-CGI-SpeedyCGI fping rrdtool-perl perl-Sys-Syslog -y
RUN yum install perl-CPAN perl-local-lib perl-Time-HiRes wget -y 
RUN yum install rrdtool perl-rrdtool openssl-devel wget httpd fping fcgi php -y
RUN yum install perl-core -y
RUN yum update -y
RUN useradd smoke

COPY smokeping opt/smokeping
RUN mkdir -p /opt/smokeping/data
RUN mkdir -p /opt/smokeping/var
RUN mkdir -p /var/www/smokeping/cache
RUN touch /opt/smokeping/mail
RUN ls -al /opt/smokeping
RUN cp /opt/smokeping/etc/config.dist /opt/smokeping/etc/config
RUN cp /opt/smokeping/etc/basepage.html.dist /opt/smokeping/etc/basepage.html
RUN cp -R /opt/smokeping/htdocs/* /var/www/smokeping
RUN mv /var/www/smokeping/smokeping.fcgi.dist /var/www/smokeping/smokeping.fcgi 
RUN chown -R apache:apache /var/www/smokeping 
RUN chown -R smoke:smoke /opt/smokeping 
RUN ls -al /var/www/smokeping/

COPY smokeping.conf /etc/httpd/conf.d/
RUN chmod 600 /opt/smokeping/etc/smokeping_secrets.dist
RUN /usr/sbin/httpd -k start 
RUN ./opt/smokeping/bin/smokeping --config=/opt/smokeping/etc/config --logfile=smoke.log

EXPOSE 80
VOLUME /opt/smokeping

COPY service.sh /opt/
RUN ls -al /opt/
RUN chmod +x /opt/service.sh
RUN chown smoke:smoke /opt/service.sh
ENTRYPOINT ["/bin/bash","--"]
CMD ["/opt/service.sh"]

