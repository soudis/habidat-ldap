#!/bin/bash

display_usage() { 
	echo "This script must take username and password"
	echo -e "\nUsage: setup.sh username password \n" 
	} 
  
 # if less than two arguments supplied, display usage 
if [  $# -le 1 ] 
then 
  display_usage
  exit 1
fi 

RUN envsubst < /setup/setup_nodes.ldif > /setup/setup_nodes.ldif

ldapadd -x -D $1 -w $2 -f /setup/setup_nodes.ldif

