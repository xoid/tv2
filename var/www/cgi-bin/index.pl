#!/usr/bin/perl

use strict; use warnings; use v5.22; use utf8;

my @stdin = <>;
warn %ENV;

if (@stdin)
{
  warn @stdin;
  system "echo @stdin > /etc/now_playing.url";

}

print "Content-type: text/html; charset: utf-8\n\n";

exit 0;

