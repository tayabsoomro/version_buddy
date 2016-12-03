#!/bin/sh

# Muhammad Tayab Soomro
# 11199539
# mts066
# CMPT 214 - Shell script for converting file names with old format to the new one.

# Old Format
#       Name_Major_Minor.Ext
# New Format
#       Name.Major.Minor.Ext


# Program Exit Error Codes
#   0 - Exit Successful
#   1 - Invalid Arguments
#   2 - File does not exist
#   3 - File not well-formed

# Usage function
usage(){
  echo $0 " <filename>"
  exit $1
}

# Boolean Function to check if the filename provided exists.
# The function takes filename as it's parameter
file_exists(){
    if [ -f $1]
    then
      return 1
    else
      return 0
    fi
}

# The function that converts filenames from old scheme to new one after all the
# necessary checks
# The function takes the filename as it's parameter
convert_filename_scheme(){
  # Checks to see if the filename provided is old scheme
  if [ is_old_scheme ]
  then
    if [ file_exists ]
    then
      echo "yes"
    else
      echo "ERROR: file does not exist"
      exit 2
  else
    echo "ERROR: filename not well-formed"
    exit 3
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
