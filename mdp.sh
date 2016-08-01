#!/bin/sh

# mdp.sh
# Meteor DePloy 

# Meteor deployment script

# ################################################################
# Setup the managment machine
# ################################################################

function mgmtSetup() {
	
	# Check if config directory exists. Create if required
	
	if [ -w ~/.mdpcfg/ ]; then
		# echo "Config directory exists"
		tmp=" " # empty command to keep if happy
	else
		echo "Config directory dosn't exist -> create"
		mkdir ~/.mdpcfg
	fi

	# Check if config file exists. Create if required

	if [ -r ~/.mdpcfg/config ]; then
		# echo "Config file exists"
		tmp=" " # empty command to keep if happy
	else
		echo "Config file dosn't exist -> create"

		echo 'ip="0.0.0.0"' > ~/.mdpcfg/config
		echo 'default_key="meteor-key"' >> ~/.mdpcfg/config
	fi

	# Read in config parameters

	source ~/.mdpcfg/config

	# Check if key files exist. Create default if required

	if [ -r ~/.mdpcfg/$default_key.pem ]; then
		echo "Key file exists"
		tmp=" " # empty command to keep if happy
	else
		echo "Key file dosn't exist -> create"

		ssh-keygen -t rsa -b 4096 -v -f $default_key -N ""

		mv $default_key ~/.mdpcfg/$default_key.pem
		mv $default_key.pub ~/.mdpcfg/$default_key.pub
	fi

	# Display status

	echo "Status"
	echo " IP              : " $ip
	echo " DEFAULT KEY FILE: " $default_key
}


function doHelp() {
	echo "Help command to be added"	
}

function chkConfigExists() {
	if [ -r  ~/.mdp.config ];
	then
		echo "local config exists"
	else
		echo "no local config"
	fi	
}

case "$1" in
	--help)
		doHelp
		;;
	setup-mgmt)
		mgmtSetup
		;;
	status)
		echo "Status command to be added"
		;;
	*)
		# No match
		echo "Usage $0 { --- to be completed --- }"
		exit 1
esac

