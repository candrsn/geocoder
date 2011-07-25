#!/bin/bash

db="/opt/geocoder_us/geocoder.db"

for n in 12 13 16 21 26 27 30 38 45 47 55 72 78 ; do
  for d in /opt/data/tiger_2010/states/${n}*;  do
    if [ -r "${d}" ]; then
      ./tiger_import_state ${db} $d
    fi
  done
done
