#!/bin/bash

mkdir config
touch config/profile

PS3="Select the platform: "

select plat in aws docker openstack; do
	case $plat in
		aws) 
			read -p "Profile name: " PROF
			read -p "AWS Access Key: " AK
			read -p "AWS Secret Key: " SK
			read -p "AWS Region: " REG
			read -p "Output format: " OF
			echo -e "["$PROF"]\naws_access_key_id = "$AK"\naws_secret_access_key = "$SK"\nregion = "$REG"\noutput = "$OF > config/profile
			break;;
		docker)
			echo "docker yo"
			break;;
		openstack)
			echo "stack yo"
			break;;
		*)
			echo "Invalid"
			break;;
	esac
done

# Set AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE in order to change command line behavior
