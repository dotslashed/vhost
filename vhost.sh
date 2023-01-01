#!/bin/bash

echo "Enter your url from httpx::"

read H_URL

wget "https://raw.githubusercontent.com/cujanovic/Virtual-host-wordlist/master/virtual-host-wordlist.txt"

N_DOM=`echo "$H_URL" | sed 's/http:\/\///g' | sed 's/https:\/\///g'`

F_LEN=`curl -s -H "Host: pagalkutta.$N_DOM" $H_URL | wc -c`

ffuf -c -w virtual-host-wordlist.txt -u $H_URL -H "Host: FUZZ.$N_DOM" -fs $F_LEN -v -t 300
