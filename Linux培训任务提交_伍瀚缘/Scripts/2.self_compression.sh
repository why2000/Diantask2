#task2. 自动根据压缩文件的后缀名进行解压
#功能：将用户输入的待解压文件解压到输入的目标目录，若无目标目录输入，则默认解压到当前目录
#Self compression according to the file name suffix
#Usage: 2.self_compression.sh [--list] or [Source compressed file] [Destination path](example:/usr)


#!/bin/sh
if [[ "$#" -eq 0 ]];then
#	无参数时默认输出使用指南
	echo -e "Usage: 2.self_compression.sh [--list] or [Source compressed file] [Destination path](example:/usr) \nSelf compression according to the file name suffix"
elif [[ "$#" > 2 ]];then
#	参数过多
	echo -e "2.self_compression.sh: too many arguments"
else
#	输出支持的文件类型列表
	if [[ "$1" = "--list" ]];then
		echo "Supported file types: zip tar gz tar.gz bz tar.bz bz2 tar.bz2"
		echo "If you want to release a file with the type of .tar.*, you can use its path and have no need to be in its directory"
	else
		case $1 in 
			*.tar)
			if [[ "$2" ]];then
				mkdir "$2"
				tar -xvf "$1" "$2"
			else
				tar -xvf "$1"
			fi
			;;

			*.tar.gz)
			if [[ "$2" ]];then
				mkdir "$2"
				tar -zxvf "$1" "$2"
			else
				tar -zxvf "$1"
			fi
			;;

			*.gz)
			if [[ "$2" ]];then
				mkdir "$2"
				cp -p "$1" "$2"
				cd "$2"
				gzip -d "$1"
				rm "$1"
			else
				gunzip "$1"
			fi
			;;

			*.tar.bz2)
			if [[ "$2" ]];then
				mkdir "$2"
				tar -jxvf "$1" "$2"
			else
				tar -jxvf "$1"
			fi
			;;

			*.bz2)
			if [[ "$2" ]];then
				mkdir "$2"
				cp -p "$1" "$2"
				cd "$2"
				bunzip2 "$1"
				rm "$1"
			else
				bunzip2 "$1"
			fi
			;;

			*.tar.bz)
			if [[ "$2" ]];then
				mkdir "$2"
				tar -jxvf "$1" "$2"
			else
				tar -jxvf "$1"
			fi
			;;

			*.bz)
			if [[ "$2" ]];then
				mkdir "$2"
				cp -p "$1" "$2"
				cd "$2"
				bzip -d "$1"
				rm "$1"
			else
				bzip2 -d "$1"
			fi
			;;

			*.zip)
			if [[ "$2" ]];then
				unzip "$1" -d "$2"
			else
				unzip "$1"
			fi
			;;

			*)
			echo "2.self_compression.sh: no such command"
			;;

		esac
	fi
fi