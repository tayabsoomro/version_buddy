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

# Function that renames the file from old scheme to new scheme
# The function takes filename as it's parameter
rename_file(){
  # Get the contents of the filename
  FILE_CONTENTS=`egrep -o "([A-Za-z]+){1}" <<< "Name_Major_Minor.sh"`
  NAME=`$FILE_CONTENTS | cut -d " " -f 1`
  MAJOR=`$FILE_CONTENTS | cut -d " " -f 2`
  MINOR=`$FILE_CONTENTS | cut -d " " -f 3`
  EXT=`$FILE_CONTENTS | cut -d " " -f 4`

  NEW_FILENAME=$NAME "." $MAJOR "." $MINOR "." $EXT
  echo $NEW_FILENAME
}

# Function to check if the string provided matches the old scheme of filename
is_old_scheme(){
  echo $1
  if egrep '^([A-Za-z]+_){2}[A-Za-z]+\.[A-Za-z]{1,}$' <<< $1 2> /dev/null 1> /dev/null
  then
    echo $1
    return 1
  else
    echo $1
    return 0
  fi
}
# The function that converts filenames from old scheme to new one after all the
# necessary checks
# The function takes the filename as it's parameter
convert_filename_scheme(){
  # Checks to see if the filename provided is old scheme
  if is_old_scheme $1
  then
    echo "is_old_scheme"
    if file_exists $1
    then
      echo "file_exists"
      rename_file $1
    else
      echo "ERROR: file does not exist"
      exit 2
    fi
  else
    echo "ERROR: filename not well-formed"
    exit 3
  fi
}


# There should only be at most one argument
if [ $# -ne 1 ]
then
  usage 1
else
  convert_filename_scheme $1
fi
