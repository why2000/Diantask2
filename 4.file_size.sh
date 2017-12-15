#task4. 获取文件夹下最大的n个文件
#功能：显示目录下最大的n个文件/子目录及其大小
#Show top N largest files/directorys in Dir
#Usage: 4.file_size.sh [-n N] [-d Dir]

#!/bin/sh
if [[ "$#" -eq 0 ]];then
    echo "The largest files/directories in ./ are:"
#   du -s不查看多级目录 -h用易读方式显示。
#   sort -r降序排序，-h用可读方式排序。
#   ln按行编号
    echo "$(du -sh * | sort -rh | nl)"
else
    if [[ "$1" = "-n" ]];then
        if [[ "$3" = "-d" ]];then
            cd "$4"
            echo "The largest ""$2"" files/directories in ""$4"" are:"
            echo "$(du -sh * | sort -rh | head -n $2 | nl)"
        else
            echo "The largest ""$2"" files/directories in ./ are:"
            echo "$(du -sh * | sort -rh | head -n $2 | nl)"
        fi
    elif [[ "$1" = "-d" ]];then
        cd "$2"
        echo "The largest files/directories in ""$2"" are:" 
        echo "$(du -sh * | sort -rh | nl)"
    else
        echo -e "Usage: 4.file_size.sh [-n N] [-d Dir]\nShow top N largest files/directorys in Dir"
    fi  
fi
