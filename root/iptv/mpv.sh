#!/bin/bash
exec >> /tmp/mpv.log 2>&1

export DISPLAY=:0
kill -9 `ps aux|grep -v grep|grep -v $$|grep mpv.sh|awk '{print $2}'`


while sleep 1
do
   URL=`cat /etc/now_playing.url`
   echo URL $URL
   [ -n "$1" ] && URL="$1"
   [ -z "$URL" ] && sleep 15
   killall -9 mpv xmessage 2>/dev/null
   [ -n "$URL" ] || continue
   /root/iptv/xtext "$URL"

   nice -n 15 mpv --vo=gpu --hwdec=drm  --cache=yes --cache-secs=60 --input-unix-socket=/tmp/mpv.sock  --network-timeout=10 -fs "$URL"

#   nice -n 15 su - vul -c "mpv --quiet --vo=vdpau --hwdec=vdpau --hwdec-codecs=all --load-unsafe-playlists \
#   --demuxer-thread=yes --cache-secs=60 --input-unix-socket=/tmp/mpv.sock \
#  --framedrop=vo --sid=no --alang=rus --fs --audio-device='alsa/plughw:CARD=sndhdmi,DEV=0'  '$URL'"

#   su - vul -c "mpv --vo=vdpau --hwdec=vdpau --hwdec-codecs=all \
#--cache-pause=no --cache-default=15360 --cache-initial=256 --demuxer-thread=yes --demuxer-readahead-secs=130 \
#--framedrop=vo --cache=50000  \
#--fs --audio-device='alsa/default:CARD=sndhdmi'  '$URL'"


done
