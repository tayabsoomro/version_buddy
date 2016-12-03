#!/bin/sh

# Muhammad Tayab Soomro
# 11199539
# mts066
# CMPT 214 - Shell script for converting file names with old format to the new one.

# Old Format
#       Name_Major_Minor.Ext
# New Format
#       Name.Major.Minor.Ext


# Usage function
usage(){
  echo $0 " <filename>"
  exit $1
}

# Function to check if the string provided matches the old scheme of filename
is_old_scheme(){
  if egrep '^([A-Za-z]+_){2}[A-Za-z]+\.[A-Za-z]{1,}$' <<< $1 2> /dev/null 1> /dev/null
  then
    return 1
  else
    return 0
  fi
}

# There should only be at most one argument
if [ $# -ne 1 ]
then
  usage 1
else
  is_old_scheme $1
fi
