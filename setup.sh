#! /bin/bash
. /dnsfw-docker/etc/conf.txt
sed -i -e "s/\[TSIG Key\]/$TSIGKEY/" /dnsfw-docker/etc/threatstop.rpz.conf 
sed -i -e "s|\[TSIG Key secret\]|$TSIGSECRET|" /dnsfw-docker/etc/threatstop.rpz.conf 
sed -i -e "s/\[ZONE\]/$ZONE/" /dnsfw-docker/etc/threatstop.rpz.conf 
sed -i -e "s/\[ZONE\]/$ZONE/" /dnsfw-docker/etc/threatstop.options.conf  
echo "restart named..."
/bin/systemctl restart named
/bin/systemctl status named
