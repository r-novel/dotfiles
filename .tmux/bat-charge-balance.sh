#!/bin/bash

high=$(pmset -g batt | grep [0-9][0-9]%)
low=$(pmset -g batt | grep [0-9]%)

count=$(echo ${high} | awk 'NR==1{print $3}' | cut -c 1-3)

if [ ${#count} -gt 1 ]; then
	echo $count
else
	count=$(echo ${low} | awk 'NR==1{print $3}' | cut -c 1-2)
	echo $count
fi
