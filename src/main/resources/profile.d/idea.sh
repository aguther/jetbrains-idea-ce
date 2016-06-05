#!/usr/bin/env bash

# get version of IBUS
IBUS_VERSION=$(ibus version)

# parse version
IBUS_VERSION_PARSED=( ${IBUS_VERSION//./ } )

# check if version is >= 1.5.11
if [ ${IBUS_VERSION_PARSED[1]} -gt 1 ]; then
	exit 0
fi
if [ ${IBUS_VERSION_PARSED[2]} -gt 5 ]; then
	exit 0
fi
if [ ${IBUS_VERSION_PARSED[3]} -ge 11 ]; then
	exit 0
fi

# enable ibus sync mode to fix IntelliJ-Bug
export IBUS_ENABLE_SYNC_MODE=1
