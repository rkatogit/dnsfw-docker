FROM centos:centos7
WORKDIR /
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
CMD ["/usr/sbin/init"]
RUN yum -y install bind bind-utils git
RUN mkdir /var/log/named
RUN chown -R named:named /var/log/named/
RUN git clone https://github.com/rkatogit/dnsfw-docker.git
RUN cp /dnsfw-docker/etc/named.conf /etc/named.conf
RUN cp /dnsfw-docker/etc/named.conf.local /etc/named.conf.local
CMD ["/usr/sbin/init"]
