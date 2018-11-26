FROM centos:centos7
WORKDIR /
RUN yum -y install bind bind-utils git 
RUN mkdir /var/log/named
RUN chown -R named:named /var/log/named/
RUN git clone https://github.com/rkatogit/dnsfw-docker.git
WORKDIR /dnsfw-docker
RUN cp ./etc/named.conf /etc/named.conf
RUN cp ./etc/named.conf.local /etc/named.conf.local


