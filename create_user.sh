#!/bin/bash
echo "How many user do you want to create?"
read input
for ((i= 1 ; i <= $input ; i++ ))
do
        useradd user$i -m -s /usr/bin/bash
        echo user$i:p455w0rd | chpasswd
        touch /home/user$i/random_data_$i
        chown user$i:user$i /home/user$i/*
done

echo "===============> User Has Been Added <================"
tail -n $input /etc/passwd

echo "==========> Home Directory Has Been Create <=========="
ls -lh /home

echo "================> Create User Success <==============="
