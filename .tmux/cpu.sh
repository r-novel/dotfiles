#!/usr/bin/env bash

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_linux() {
	[ $(uname) == "Linux" ]
}

is_cygwin() {
	command -v WMIC &> /dev/null
}

cpus_number() {
	if is_linux; then
		nproc
	else
		sysctl -n hw.physicalcpu
	fi
}

cpu_load() {
	if is_osx; then
		load=`ps aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {print s}'`
		cpus=$(cpus_number)
		echo "$load $cpus" | awk '{printf "%5.2f%%\n", $1/$2}'
	elif is_cygwin; then
		usage="$(WMIC cpu get LoadPercentage | grep -Eo '^[0-9]+')"
		printf "%5.1f%%" $usage
	else
		load=`ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {print s}'`
		cpus=$(cpus_number)
		echo "$load $cpus" | awk '{printf "%5.2f%%", $1/$2}'
	fi	
}
cpu_load
