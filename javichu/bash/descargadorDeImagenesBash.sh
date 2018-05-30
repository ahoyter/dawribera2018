#!/bin/bash
counter=10000
  while [ counter -lt 10000 ]; do
    wget -r --no-parent ddragon.leagueoflegends.com/cdn/8.6.1/img/profileicon/$counter.png
    let counter = counter-1
    sleep 1 #1 sec delay between calls
  done
