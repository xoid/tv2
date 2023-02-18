#!/bin/bash

exec > /tmp/playlist.log 2>&1

URLS="https://af-play.com/playlist/u07nx7jh.m3u8 \
      http://iptvm3u.ru/onelist.m3u \
      https://smarttvnews.ru/apps/freeiptv.m3u \
      http://webhalpme.ru/kids.m3u \
      https://tv2sim.ru/iptv-m3u/russia.m3u \
      http://topplay.do.am/FreeBestTV.m3u"
      
# http://iptvbarmen.tk/auto.nogrp.q.m3u \

MAIN='mail.m3u'
 ALL='all.m3u'

cd /media
echo '#EXTM3U' > $MAIN.new
echo '#EXTM3U' > $ALL.new

for URL in $URLS
do
    echo MAIN URL $URL
    echo MAIN URL $URL >> $ALL.new
    curl -k -L "$URL"|grep -v '#EXTM3U\|EXTGRP' >> $ALL.new
done
#exit 0
[ -s "$ALL.new" ] && mv -f $ALL.new $ALL

cat /root/iptv/header.html  > /root/iptv/index.html.new
/root/iptv/playlist.pl $ALL   >> /root/iptv/index.html.new
cat /root/iptv/footer.html >> /root/iptv/index.html.new

cp -f /root/iptv/index.html.new  /root/iptv/index.html
cp -f /root/iptv/index.html.new  /var/www/html/index.html

#grep -i -A2 "СТС\|НТВ\|science\|discovery\|первый канал\|Cartoon" $ALL |grep -v '^--' >> $MAIN
# reread xupnpd
#curl http://192.168.171.197:4044/scripts/scan.lua > /dev/null
#mkdir -p /var/run/ssh /var/run/sshd

