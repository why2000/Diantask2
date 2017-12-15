#task5. 获取文件夹下最大的n个文件
#功能：显示目录下最大的n个文件/子目录及其大小
#Trans a file between unix type and dos type
#Usage: command [FileName]
#Command should be 5.dos2unix.sh or 5.unix2dos.sh

#!/bin/sh
file="./5.unix2dos.sh"
if [ -f "$file" ];then
    echo "Start coverting"
else
    ln 5.dos2unix.sh 5.unix2dos.sh
    echo "Start coverting"
fi
if [[ "$#" -eq 0 ]];then
    echo -e "Usage: command [FileName]\nCommand should be 5.dos2unix.sh or 5.unix2dos.sh"
else
    echo "$0"
    case $0 in 
	    *5.dos2unix.sh)
            dos2unix "$1"
        ;;
        *5.unix2dos.sh)
            unix2dos "$1"
        ;;
        *)
            echo -e "Usage: command [FileName]\nCommand should be 5.dos2unix.sh or 5.unix2dos.sh"
        ;;
    esac
fi
