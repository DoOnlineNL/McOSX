#!/bin/bash

function _CHECK_ROOT()
{

	[[ $EUID -ne 0 ]] && \
	echo -n "You need to be root, please use 'sudo ./`basename ${0}`'." && \
	return 1 || \
	echo -n "Preview will now start and run for '5' seconds, please wait..." && \
	sleep 2 && \
	return 0;

}

function _RUN_PREVIEW()
{

	plymouthd && \
	plymouth --show-splash & \
	sleep 5 && \
	plymouth quit && \

	echo -n "Preview ended, read README.MD for installation instructions." && \
	return 0 || \

	echo -n "Preview couldn't be shown, please use 'sudo ./`basename ${0}`' or make sure playmouthd is running..." && \
	return 1;

}

_CHECK_ROOT && \
_RUN_PREVIEW && \
exit 0 || \
echo -n "[ERROR] Caught exit code 1 for '`basename ${0}`'..." && \
exit 1;

