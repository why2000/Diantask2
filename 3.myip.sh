#task3. 实现自己的ip命令
#功能：可以实现查看本机ip以及为本机指定新的ip地址和子网掩码
#Show the ip address and change it and/or the subnet mask
#Usage: 3.myip.sh [-ip] [ip_address] [-mask] [subnet_mask]

#！/bin/sh
#column -t ipstatus

num="$(./ifconfig | grep '^e..[0-9]' | sed -n '1p' | sed 's/://g'| awk '{print $1}')"
if [[ "$#" -eq 0 ]]; then
    touch ipstatus
    echo "NIC   IP_Address" > ipstatus
    echo -e "$num\c" >> ipstatus
    echo -e "  \c" >> ipstatus
    echo "$(./ifconfig $num | grep 'netmask' | sed -n '1p' | awk '{print $2}')" >> ipstatus
    column -t ipstatus
elif [[ $1 = "-ip" && $3 = "-mask" ]]; then
    eval "ifconfig $num $2 netmask $4"
else
    echo -e "Usage: 3.myip.sh [-ip] [ip_address] [-mask] [subnet_mask]\nShow the ip address and change it and/or the subnet mask"
fi
rm ipstatus
