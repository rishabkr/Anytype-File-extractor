#!/bin/bash
typ=$(echo $1|sed 's/^.*\.//')
echo $typ
path=$1
#gzip -t $path 2>/dev/null
#status=$?
#if [[ $status -eq 0 ]]
if [[ "$typ" != "zip" && "$typ" != "Z" && "$typ" != "tar.bz2" && "$typ" != "tar.gz" && "$typ" != "bz2" && "$typ" != "gz" && "$typ" != "tar" && "$typ" != "tbz2" && "$typ" != "tgz" && "$typ" != "rar" && "$typ" != "jar" ]];
then
echo "Incorrect file type ! $typ is not a compressed file. Please pass a compressed file "
exit
elif [[ "$typ" == "zip" ]];
then
unzip $path 
exit
elif [[ "$typ" == "Z" ]];
then
gzip -d $path
exit
elif [[ "$typ" == "tar.bz2" ]];
then
tar xjf $path
exit
elif [[ "$typ" == "tar.gz" ]];
then
tar xzf $path
exit
elif [[ "$typ" == "bz2" ]];
then
bunzip2 $path
exit
elif [[ "$typ" == "gz" ]];
then
gunzip $path
exit
elif [[ "$typ" == "tar" ]];
then
tar xf $path
exit
elif [[ "$typ" == "tbz2" ]];
then
tar -xjf $path
exit
elif [[ "$typ" == "tgz" ]];
then
tar -xzf $path
exit
elif [[ "$typ" == "rar" ]];
then
unrar x -r $path
exit
elif [[ "$typ" == "jar" ]];
then
jar -xvf $path
exit
else 
echo "$path is not a valid file"
fi
