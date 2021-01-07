#!/bin/bash --posix

LC_ALL=C awk '
  /^[^;]/ {
    s = substr($0, index($0, " ") + 1)
    print "+" length($1) "," length(s) ":" $1 "->" s
  }
  END {
    print ""
  }
 ' $1 | cdb -c -t - $1.cdb
