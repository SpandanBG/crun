#!/bin/bash
name=$1
fol=${name%.*}
path=`pwd`
dstr="Date: `date`"
ctpath="/template/ctemp.c"
cpptpath="/template/cpptemp.cpp"
source=$path/$fol/$name
exe=$path/$fol/$fol

if [ ${name: -2} == ".c" ]
then
    if [ ! -f $source ]
    then
        mkdir $fol
        cp $ctpath $source
        sed "3i\ $dstr" "$source" -i
    fi
    nano $source -c
    rm $exe
    clear
    gcc $source -g -lm -o $exe
    ./$fol/$fol

elif [ ${name: -4} == ".cpp" ]
then
    if [ ! -f $source ]
    then
        mkdir $fol
        cp $cpptpath $source
        sed "3i\ $dstr" "$source" -i
    fi
    nano $source -c
    rm $exe
    clear
    g++ $source -g -lm -o $exe
    ./$fol/$fol
   
else
    echo "UNRECOGNIZED FORMAT!"
fi