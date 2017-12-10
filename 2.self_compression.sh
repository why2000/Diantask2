#!/bin/sh
if [[ "$#" -eq 0 ]];then
	echo -e "usage: 2.self_compression.sh [--list] or [Source compressed file] [Destination path] \nSelf compression according to the file name suffix"
elif [[ "$#" > 2 ]];then
	echo -e "2.self_compression.sh: too many arguments"
else 
	if [[ "$1" = "--list" ]];then
		echo "Supported file types: zip tar gz tar.gz bz tar.bz bz2 tar.bz2"
	else
		case $1 in 
			*.tar)
			if [[ "$2" ]];then
				echo "test"
			else
				tar xvf $1
			fi
			;;
			*.gz)
			if [[ "$2" ]];then
				echo "test"
			else
				gunzip $1
			fi
			;;
			*.tar.gz)
			if [[ "$2" ]];then
				echo "test"
			else
				tar zxvf $1
			fi
			;;
			*.bz2)
			if [[ "$2" ]];then
				echo "test"
			else
				bunzip2 $1
			fi
			;;
			*.tar.bz2)
			if [[ "$2" ]];then
				echo "test"
			else
				tar jxvf $1
			fi
			;;
			*.bz)
			if [[ "$2" ]];then
				echo "test"
			else
				bzip2 -d $1
			fi
			;;
			*.tar.bz)
			if [[ "$2" ]];then
				echo "test"
			else
				tar jxvf $1
			fi
			;;
			*.zip)
			if [[ "$2" ]];then
				echo "test"
			else
				unzip $1
			fi
			;;
			*)
			echo "2.self_compression.sh: no such command"
			;;
		esac
	fi
fi