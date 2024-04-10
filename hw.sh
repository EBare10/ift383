#!/bin/bash
asurite="embishop"

read -p "Enter the lab letter: " labletter
read -p "Enter the task number: " tasknum

tasknum=$(printf "%02d" $tasknum)

if [[ $labletter =~ [dD] ]]
then
	ext=".awk"
	interp="#!/usr/bin/awk -f"

elif [[ $labletter =~ [efEF] ]]
then
	ext=".sh"
	interp="#!/bin/bash"

elif [[ $labletter =~ [ghGH] ]]
then
	ext=".py"
	interp="#!/usr/bin/python3"

else
	ext=".sh"
	interp="#!/bin/bash"

fi

filename="lab_"$labletter"_task_"$tasknum"_"$asurite$ext

if [ -f $filename ]
then
	echo "$filename already exists, try again."
	exit 111
else
	echo $interp > $filename
	chmod +x $filename
	vim $filename
fi
