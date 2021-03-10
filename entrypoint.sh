#!/bin/sh -l

echo "Hello $1"

ls -l
cd ./home/
ls -l
cd ./devenv/
ls -l
cd ./_build_/
#cd ./home/devenv/_build_/
#make

#echo ^^^^ check ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#[ -f ./application ] && echo application exist || echo application not exist
#[ -f ./application ] && ./application
#echo $?

#echo ^^^^ clean ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#make clean

time=$(date)
echo "::set-output name=time::$time"
