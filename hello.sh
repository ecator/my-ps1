#!/bin/bash
# 你用cowsay打印Hello  $USER
# 必须在新进程中调用，引入方式可能会造成shell整体推出

if [ -z "$(which cowsay)" ]; then
    echo Hello $USER
    exit
fi
cow_file=$(cowsay -l | grep -oE '/.*?:')
cow_file=${cow_file%:}
cnt=`ls ${cow_file}/*.cow | wc -l`
declare -a cows
for i in ${cow_file}/*.cow
do
    cows[${#cows[@]}]=$i
done
i=$[RANDOM % $cnt]
cowdo="cowsay"
[ $[RANDOM % 2] -eq 0 ] && cowdo="cowthink"
$cowdo -f "${cows[$i]}" "Hello $USER"