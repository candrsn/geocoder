#!/bin/bash

db=/opt/geocoder_us/geocoder.db
tiger=/opt/data/tiger_2010/states

rm ${db}
sqlite3 ${db} < sql/place.sql
sqlite3 ${db} < sql/create.sql

bash ./tiger_import ${db} ${tiger}

bash ./rebuild_cluster ${db}

