#!/bin/bash
delay=$(cat config.ini)
while [[ 1 == 1 ]]; do
	list=$(wget -q http://pogoda.tut.by/ -O - | grep '<span class="temp-i">' | sed -n 1p | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' | sed 's/&deg;//g' )
	echo $list"°C"
	sleep $delay 
done

