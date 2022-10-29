for b in 00 00 55 aa 00 00 04 7a 00 00 00 0d 00 00 00 37 33 2e 33 00 00 00 00 00 00 00 09 00 06 19 32 92 fd 01 bc 47 8e a6 4b d8 6d 6a 23 c8 48 da 3f 5f e5 27 03 be af 89 83 2e 7a d8 b7 5c 1b a6 67 a6 cb 7e e3 00 00 aa 55 
do
  D="$D\x$b"
done

echo  $D #|nc wlan0 6668


