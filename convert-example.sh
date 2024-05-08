#!/bin/bash

for file in `ls *.jpg`
do
    newfile=`echo $file | sed 's/jpg/png/'`
    convert $file $newfile
done
