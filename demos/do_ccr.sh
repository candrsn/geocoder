#!/bin/bash

# download the Central Contractor registry (CCR) from data.gov
# place it in /opt/data/ccr/CCR.csv
# build a tiger geocoder into /opy/geocoder_us/geocoder.db


ruby -rubygems -I../lib do_ccr.rb

