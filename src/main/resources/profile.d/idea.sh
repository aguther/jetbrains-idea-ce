#!/usr/bin/env bash

# determine if ibus is available
if hash ibus 2>/dev/null; then
	# get version of IBUS
	IBUS_VERSION=$(ibus version)

	# parse version
	IBUS_VERSION_PARSED=( ${IBUS_VERSION//./ } )

	# check if version is >= 1.5.11
	if [ ${IBUS_VERSION_PARSED[1]} -le 1 ]; then
		if [ ${IBUS_VERSION_PARSED[2]} -le 5 ]; then
			if [ ${IBUS_VERSION_PARSED[3]} -lt 11 ]; then
				# enable ibus sync mode to fix IntelliJ-Bug
				export IBUS_ENABLE_SYNC_MODE=1
			fi
		fi
	fi
fi
