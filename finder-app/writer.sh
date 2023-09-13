#!/bin/sh
#
# This script performs the following:
# - Accepts the following arguments: the first argument is a full path to a file (including filename) on the
#   filesystem, referred to below as writefile; the second argument is a text string which will be written within
#   this file, referred to below as writestr.
#
#   Exits with value 1 error and print statements if any of the arguments above were not specified.
#
#   Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating
#   the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
#
#   Example:
#       writer.sh /tmp/aesd/assignment1/sample.txt ios
#
#   Creates file:
#       /tmp/aesd/assignment1/sample.txt
#
#   With content:
#       ios

if [ $# -lt 2 ]
then
    echo "Fail: All parameters were not specified."
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

WRITEDIR=$( dirname $WRITEFILE )

mkdir -p "$WRITEDIR"

echo ${WRITESTR} > "$WRITEFILE"

if [ ! -f "$WRITEFILE" ]
then
    echo "${WRITEFILE} could not be created."
    exit 1
fi
