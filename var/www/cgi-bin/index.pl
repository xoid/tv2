#!/usr/bin/perl

use strict; use warnings; use v5.22; use utf8;

my @stdin = <>;
#warn %ENV;

if (@stdin)
{
  warn "STDIN = ".join('|', @stdin)."\n";
  system "echo @stdin > /etc/now_playing.url";
  system "killall mpv";
}

if ($ENV{QUERY_STRING} =~ /cmd=(.*)/)
{
  my $cmd = $1;
  if ($cmd eq 'stop')
  {
    system "echo > /etc/now_playing.url";
    system "killall mpv";
  }
}

print "Content-type: text/html; charset: utf-8\n\n";

exit 0;

