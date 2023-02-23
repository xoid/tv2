while sleep 10
do
  SIZE=`ls -l  /tmp/mpv.log| cut -d ' ' -f 5`

  [[ "$SIZE" -eq "$PREV_SIZE" ]] && [[ -s /etc/now_playing.url ]] && killall mpv

  PREV_SIZE=$SIZE
done

