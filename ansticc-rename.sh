#!/bin/bash
#
# renames output files from mostly recent ansticc run, using custom basename.
#
# Copyright to it's authors. See the COPYRIGHT file at the top-level directory
# of this distribution.
#
# This file is part of ansticc. It is subject to the license terms in the
# LICENSE file found in the top-level directory of this distribution. No part
# of ansticc, including this file, may be copied, modified, propagated, or
# distributed except according to the terms contained in the LICENSE file.

# Usage in the case of incorrect number of arguments

syntax() {

 echo "Usage: $0 [old basename] <new basename>"

 exit 64

}

if [[ `expr $# : [1,2]` -eq "0" ]]
then
 syntax
 exit 64
fi


if [ "$#" -eq "1" ]
then

 # get new basename from command-line argument
 newBaseName=$1

 # get old basename from most recently modified .AFO file
 fileafo=`ls --sort=time *.AFO | head -n1`
 filebase=`basename ${fileafo} .AFO`
 echo $filebase $newBaseName

else
 
 # get old basename from command-line
 filebase=$1

 # get new basename from command-line argument
 newBaseName=$2

fi

# rename files
for ext in .COR2 .TEST1 .VER .AFO .EHH .BTH .BBO .RMS .PTMY .ansout .SHH -histPtmy.ansout -histRcmt.ansout -histNptm.ansout -histPtmt.ansout -sorttime.ansout
do
 # find how many files that starts with $filebase and ends in $ext
 if [ "`ls ${filebase}*${ext} 2> /dev/null | wc -l`" -eq "1" ]
 then
  thisFile=`ls ${filebase}*${ext}`
  echo ${thisFile}
  newfile=`echo ${thisFile} | sed "s/${filebase}/${newBaseName}/"`
  mv ${thisFile} ${newfile}
 fi
 # if file exists and there is only one of them, rename it

# echo ${newBaseName}${ext}

done
