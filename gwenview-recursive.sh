#!/bin/bash

clear

dir_name="temp_pictures"
p=`pwd`
IFS=$'\n'
mkdir $dir_name

scan()
{
	for e in "$1"/*
	do 
		if [ -f "$e" ]
		then
			ln -s $e $p"/"$dir_name"/"
		elif [ -d "$e" ]
		then
			folder=$p"/"$dir_name
			if [ $folder != $e ]
			then
				scan "$e"
			fi
		fi
	done
}

scan "$p"
gwenview $p"/"$dir_name
rm -rf $dir_name
