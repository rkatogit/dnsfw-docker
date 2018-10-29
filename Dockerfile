FROM centos:centos7
RUN yum -y install bind bind-utils 
RUN mkdir /var/log/named
RUN chown -R named:named /var/log/named/
COPY ./named.conf /etc/named.conf
COPY ./threatstop.options.conf /etc/threatstop.options.conf
COPY ./named.conf.local /etc/named.conf.local
COPY ./threatstop.rpz.conf /etc/threatstop.rpz.conf
COPY ./threatstop.logging.conf /etc/threatstop.logging.conf
COPY ./conf.txt /
COPY ./setup.sh /


