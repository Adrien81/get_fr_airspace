#!/bin/bash

# usage: ./get_fr_airspace.sh

rm /tmp/tmp1.txt /tmp/tmp2.txt

python get_url.py > /tmp/tmp1.txt

awk 'NR==1' /tmp/tmp1.txt > /tmp/tmp2.txt

if [ -d prev ]; then
    cd prev
else
    mkdir prev
    cd prev
fi
wget -i /tmp/tmp2.txt

echo " "
echo "Most recent file is:"
ls -tr | tail -1

cd ..

rm latest_france_airspace.txt
rm /tmp/ASFILENAME.txt
echo -n "ASFILENAME=" >> /tmp/ASFILENAME.txt
ls -tr prev/* | tail -1 >> /tmp/ASFILENAME.txt
source /tmp/ASFILENAME.txt
ln -s $ASFILENAME latest_france_airspace.txt