#!/bin/bash

TARG=$1

for f in $(find ./ -name '*.cpp' -or -name '*.cc' -or -name '*.h' -or -name '*.txt' -or -name '*.hpp'); do
    grep "$TARG" -n  $f; 
    if [ $? -eq 0 ]; then
         echo $f; 
    fi;
done
