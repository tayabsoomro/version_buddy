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


# There should only be at most one argument
if [ $# -ne 1 ]
then
    usage 1
fi
