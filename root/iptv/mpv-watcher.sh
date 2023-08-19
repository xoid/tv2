#!/bin/bash

exec>/tmp/mpv-watcher.log 2>&1

while sleep 20
do
  SIZE=`ls -l  /tmp/mpv.log| cut -d ' ' -f 5`

  [ "$SIZE" -eq "$PREV_SIZE" ] && [ -s /etc/now_playing.url ] && killall mpv

  PREV_SIZE=$SIZE
done

