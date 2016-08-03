#!/bin/sh

# mdp.sh
# Meteor DePloy 

# Meteor deployment script

# ################################################################
# Show the status
# ################################################################

function showConfig(){

	if [ -r ~/.mdpcfg/ip.config -a -r ~/.mdpcfg/key.config -a -r ~/.mdpcfg/user.config ]; then
		source ~/.mdpcfg/ip.config
		source ~/.mdpcfg/key.config
		source ~/.mdpcfg/user.config
		echo "Status"
		echo " IP              : " $ip
		echo " USERNAME        : " $user
		echo " DEFAULT KEY FILE: " $default_key	
	else
		echo ""
		echo "Configuration file dosen't exist. Create the file with the following command,"
		echo ""
		echo "    $0 setup"
	fi
}

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

	if [ -r ~/.mdpcfg/ip.config -a -r ~/.mdpcfg/key.config -a -r ~/.mdpcfg/user.config ]; then
		# echo "Config file exists"
		tmp=" " # empty command to keep if happy
	else
		echo "Config file dosn't exist -> create"

		echo 'ip="0.0.0.0"' > ~/.mdpcfg/ip.config
		echo 'default_key="meteor-key"' > ~/.mdpcfg/key.config
		echo 'user="user"' > ~/.mdpcfg/user.config
	fi

	# Read in config parameters

	source ~/.mdpcfg/ip.config
	source ~/.mdpcfg/key.config
	source ~/.mdpcfg/user.config

	# Check if key files exist. Create default if required

	if [ -r ~/.mdpcfg/$default_key.pem ]; then
		echo "Key file exists"
		tmp=" " # empty command to keep if happy
	else
		echo "Key file dosn't exist -> create"

		# Generate the key pair
		#
		# -t rsa	RSA key type
		# -b 4096	Number of bits in the key
		# -v		Verbose output
		# -f $1		Key output file
		# -N ""		Pass-phrase

		ssh-keygen -t rsa -b 4096 -v -f $default_key -N ""

		mv $default_key ~/.mdpcfg/$default_key.pem
		mv $default_key.pub ~/.mdpcfg/$default_key.pub
	fi

	# Display status
	showConfig
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

function displaySetUsage(){
	echo ""
	echo "Set usage:"
	echo "   $0 set [name] [value]"
	echo ""
	echo "   name  = [ ip | user ]"	
	echo "   value = the value"
}

function processSet() {
	case "$#" in
		1)
			displaySetUsage $@
			;;
		2)
			displaySetUsage $@
			;;
		3)
			# process the value
			echo "need to set $2 = $3"
			case "$2" in
				ip)
					echo 'ip='$3 > ~/.mdpcfg/ip.config
					;;
				user)
					echo 'user'=$3 > ~/.mdpcfg/user.config
					;;
				*)
					echo "ERROR: $2 is not a valid variable to set"
					;;
			esac
			;;
		*)
			;;
	esac
}

case "$1" in
	help)
		doHelp
		;;
	setup)
		mgmtSetup
		;;
	config)
		showConfig
		;;
	set)
		processSet $@
		;;
	*)
		# No match
		echo "Usage $0 { setup | config | help | set [name] [value] }"
		exit 1
esac

