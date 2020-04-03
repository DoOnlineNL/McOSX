#!/bin/bash
# version 1.0-r1.3
# Inspired by Navis Michael Bearly & Darwin Plymouth
# Released by doOnline
# contact@doonline.nl

Text='\033[1;32m'
NC='\033[0m'

if ((${EUID:-0} || "$(id -u)")); then
  	clear;
		sleep 1.5;
			echo -e "${NC}Sorry, You are not root";
		sleep 1.0;
			echo "Please run using sudo command";
		sleep 1.0;
			echo -e "${Text}Cancelling Installation Command";
		sleep 1.5;
	exit 1;
else
  	clear;
	  	sleep 1.0;
	  		echo -e "${Text}Please wait until installation finishes...";
	  	sleep 1.5;
	  		echo -e "${NC}Copying all 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme files to plymouth's theme directory...";
	  		cp -iRv ./ /usr/share/plymouth/themes/McOSX;
	  	sleep 1.5;
	  		echo -e "${NC}Finished copying all 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme files to plymouth's theme directory...";
	  	sleep 1.0;
  	clear;
  		sleep 1.0;
  			echo -e "${NC}Configuring 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme...";
  		sleep 1.5;
  			update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/McOSX/McOSX.plymouth 100;
  		sleep 1.5;
  			echo -e "${NC}Finished configuring 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme...";
  		sleep 1.0;
  	clear;
  		sleep 1.0;
  			echo "${Text}Select a number from which you want to enable the plymouth splash theme:";
  		sleep 0.5;
    			echo -e "${NC} ";
  			update-alternatives --config default.plymouth && \
  			update-initramfs -u || \
		sleep 1.0 && \
			echo -e "${NC}Failed installation for 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme when updating initramfs... Exiting!" && sleep 2.0 && exit 1;
  		sleep 1.5;
  			echo -e "${NC}Finished installation for 'McOSX - Plymouth Boot Theme v1.0-r1.3' theme!";
  		sleep 1.0;
  	clear;
fi
