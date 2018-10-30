#DNSFW FOR BIND

##Overview
easy setup of BIND to integrate with ThreatSTOP using Docker.
this container image built on CentOS7.

##Installation
```
$ git clone https://github.com/rkatogit/dnsfw-docker.git 
```

```
$ docker build -t bind:1 .
$ docker run -p 53:53 -d --privileged --name bind_ts bind:1 /sbin/init
$ docker exec -it bind_ts /bin/bash
```
edit conf.txt and change each value accoding to device settings.
```
TSIGKEY="<TSIG Key name retrieved from device settings>"
TSIGSECRET="<TSIG Key secret retrieved from device settings>"
ZONE="<Zone name retrieved from device settings>"
```
execute setup script.
```
$ ./setup.sh 
```
##Usage
use as DNS cache server(Forwarder).
###Check
```
$ dig @127.0.0.1 bad.threatstop.com         

; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7_5.1 <<>> @127.0.0.1 bad.threatstop.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 13285
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;bad.threatstop.com.		IN	A



RPZ log file
/var/log/named/rpz.log

30-Oct-2018 04:53:40.564 rpz: info: client 127.0.0.1#40466 (bad.threatstop.com): rpz QNAME NXDOMAIN rewrite bad.threatstop.com via bad.threatstop.com.basic-dnsfw.rpz.threatstop.local
```

##Tips
Output Zone file content as text
```
$ dig @192.124.129.51 -t axfr -y <TSIG Key>:<TSIG Key Secret> <ZONE> AXFR > output
```

##Others
Zone file
/var/named/slaves/<ZONE>

Change Zone tranfers from binary to text.
```
zone "Basic-DNSFW.rpz.threatstop.local" {
    type slave;
    masterfile-format text; <--- add this line
    masters { 192.124.129.51; };
    file "slaves/Basic-DNSFW.rpz.threatstop.local";
};
```

