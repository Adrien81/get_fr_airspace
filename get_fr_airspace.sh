#!/bin/bash

# usage: ./get_fr_airspace.sh

rm /tmp/tmp1.txt /tmp/tmp2.txt

python get_url.py > /tmp/tmp1.txt

awk 'NR==1' /tmp/tmp1.txt > /tmp/tmp2.txt

cd prev
wget -i /tmp/tmp2.txt

echo " "
echo "Most recent file is:"
ls -tr | tail -1

cd ..
