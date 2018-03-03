#!/bin/bash

display_usage() { 
	echo "This script must take username and password
	echo -e "\nUsage: setup.sh username password \n" 
	} 
  
 # if less than two arguments supplied, display usage 
if [  $# -le 1 ] 
then 
  display_usage
  exit 1
fi 

ldapadd -x -Q -D $1 -w $2 -f setup_nodes.ldif
ldapadd -x -Q -D $1 -w $2 -f setup_memberof.ldif
ldapmodify -x -Q -D $1 -w $2 -f setup_refint1.ldif
ldapadd -x -Q -D $1 -w $2 -f setup_refint2.ldif

