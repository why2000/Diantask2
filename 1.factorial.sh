#task1. 递归阶乘
#功能：用户输入一个非负整数n，通过递归函数计算n的阶乘并输出
#Calculate the fact of original_number
#Usage: 1.factorial.sh [original_number]

#！/bin/sh
status=1
if [[ "$#" -eq 0 ]];then
	status=0
fi
#func_name fac1
#Usage:fac1 n
#由于return只能传递255以内的整数值, 此函数只能计算小于等于5的阶乘
function fac1(){
	if [[ "$1" -eq 0 ]];then
		return 1
	else
		fac1 $[ "$1"-1 ]
		return $[ "$1"*$[ "$?" ] ]
	fi
}

#func_name fac2
#Usage:fac2 n
#此函数用全局变量来实现更大数字的阶乘计算
res2=1
function fac2(){
	if [[ "$1" -eq 0 ]];then
		res2=$[ "$res2"*1 ]
	else
		fac2 $[ "$1"-1 ]
		res2=$[ "$res2"*"$1" ]
	fi
	return 0
}

if [[ "$status" -eq 0 ]];then
	echo -e "Usage: 1.factorial.sh [original_number]\nCalculate the fact of original_number"
else
	if [[ "$1" -lt 6 ]];then
		fac1 "$1"
		res1="$?"
		echo "In \"return\" mod, The fact of $1 is $res1"
	elif [[ "$1" -ge 6 ]];then
		fac2 "$1"
		echo "In global var mod, The fact of $1 is $res2"
	else
		echo "Original number should be greater than or equal to 0"
	fi
fi
