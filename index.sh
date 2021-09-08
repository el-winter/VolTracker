#!/bin/bash

# gain data in excel format
date_var=$(TZ=Europe/Moscow date +"%d.%m.%Y %H:%M")

# /dev/mapper/rhel-root - tracing voume name | deleting duplicate spaces
str=$(df -h  --output=source,size,used /dev/mapper/rhel-root | grep /dev/mapper/rhel-root | tr -s " ")
#echo $str

# removing volume name, 23 - length of volume name + space
str=${str:22}
#echo $str

# ' ' -> ';' substitution
str=${str// /;}
#echo $str

# deleting a-Z symbols
str=${str//[a-Z]/''}
#echo $str

# result.txt - result file in /
result=$date_var';'$str
echo $result >> /result.csv


# 0 * * * * /home/index