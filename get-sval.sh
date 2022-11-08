#!/bin/bash

if [ "$#" -ne 6 ]; then
echo "invalid number of arguments"
echo "required arguments:"
echo "-t, --target	target URI"
echo "-k, --key	required key from object"
echo "-n, --number	number of objects to process"
exit 1
fi

case "$1" in
"-t" ) target="$2";;
"--target" ) target="$2";;
"-k" ) key="$2";;
"--key" ) key="$2";;
"-n" ) num="$2";;
"--number" ) num="$2";;
esac

case "$3" in
"-t" ) target="$4";;
"--target" ) target="$4";;
"-k" ) key="$4";;
"--key" ) key="$4";;
"-n" ) num="$4";;
"--number" ) num="$4";;
esac

case "$5" in
"-t" ) target="$6";;
"--target" ) target="$6";;
"-k" ) key="$6";;
"--key" ) key="$6";;
"-n" ) num="$6";;
"--number" ) num="$6";;
esac

curl -s "$target" | grep -o '"'"$key"'": "[^"]*"' | head -n "$num" | sed 's/"'"$key"'": "//' | sed 's/"//' | sed 's/\s/\n/g' | sort
