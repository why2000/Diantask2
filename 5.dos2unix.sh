#task5. dos和unix文件格式转换
#功能：实现两种文件格式的转换
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
    
    case $0 in 
	    *5.dos2unix.sh)
            echo "dos2unix.sh"
            sed -i 's/%13//g' $1
            cat -v "$1"
        ;;
        *5.unix2dos.sh)
            echo "unix2dos.sh"
            sed -i 's/$/\r/g' $1
            cat -v "$1"
        ;;
        *)
            echo -e "Usage: command [FileName]\nCommand should be 5.dos2unix.sh or 5.unix2dos.sh"
        ;;
    esac
fi
