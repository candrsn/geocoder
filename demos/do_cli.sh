#!/bin/bash

echo "please enter an address"
read addr

if [ -n "$addr" ]; then
while [ -n "$addr" ]; do
  ruby -rubygems -I../lib cli.rb "$addr"

  echo "Next address or a blank line to quit"
  read addr
done
exit
else
ruby -rubygems -I../lib cli.rb "101 columbia rd, morristown nj, 07960" 

ruby -rubygems -I../lib cli.rb "141 Pryor St SW, ATLANTA, GA"

ruby -rubygems -I../lib cli.rb "vetrans parkway & mercer Av, bloomington IL 61704"

fi

