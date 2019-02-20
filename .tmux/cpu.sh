#!/usr/bin/env bash

function is_osx() {
	[ $(uname) == "Darwin" ]
}

function is_linux() {
	[ $(uname) == "Linux" ]
}

function cpus_number() {
	if is_linux; then
		nproc
	else
		sysctl -n hw.physicalcpu
	fi
}

function cpu_load() {
	if [ is_osx ] || [ is_linux ]; then
		load=`ps aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {print s}'`
		cpus=$(cpus_number)
		echo "$load $cpus" | awk '{printf "%5.2f%%\n", $1/$2}'
	fi	
}
cpu_load
