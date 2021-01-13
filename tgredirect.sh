#!/bin/bash

importantlines=""
if [ -p /dev/stdin ]; then
	while IFS= read -r line; do
		if [[ $line =~ .*Verif.* ]]; then
			importantlines="|$importantlines$line"
		fi
	done
fi

curl --request POST --url "$1" --data-raw "$2$importantlines"
