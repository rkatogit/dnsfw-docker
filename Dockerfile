FROM centos:centos7
WORKDIR /
RUN yum -y install bind bind-utils git 
RUN mkdir /var/log/named
RUN chown -R named:named /var/log/named/
RUN git clone https://github.com/rkatogit/dnsfw-docker.git
WORKDIR /dnsfw-docker
RUN cp ./named.conf /etc/named.conf
RUN cp ./threatstop.options.conf /etc/threatstop.options.conf
RUN cp ./named.conf.local /etc/named.conf.local
RUN cp ./threatstop.rpz.conf /etc/threatstop.rpz.conf
RUN cp ./threatstop.logging.conf /etc/threatstop.logging.conf


