#!/bin/bash

# tracing volume name
vol=/dev/mapper/rhel-root
# lenght of tracing volume + 1 space
vol_length=${#vol}
vol_length=$(($vol_length+1))

# gain date in excel format
date_var=$(TZ=Europe/Moscow date +"%d.%m.%Y %H:%M")

# deleting duplicate spaces
str=$(df -h  --output=source,size,used $vol | grep $vol | tr -s " ")

# removing volume name, 22 - length of volume name + space
str=${str:$vol_length}

# ' ' -> ';' substitution
str=${str// /;}

# deleting a-Z symbols
str=${str//[a-Z]/''}

# result.txt - result file in /
result=$date_var';'$str
echo $result >> /result.csv

# crontab -e
# 0 * * * * /home/index.sh
