#!/bin/bash

echo "Enter the file location: ABSOLUTE PATH"
read file

rm -rf /home/kali/bash-scripts/js-files
if [ -n "$file" ]
then
        if [ -f "$file" ]
        then
                cat $file | grep -i "js" | cut -d "/" -f5 | cut -d " " -f1 | sort | un>
                if [ -s "/home/kali/bash-scripts/js-files" ]
                then
                        echo "Found Some javascript files"
                        echo "******************************"
                        cat -n /home/kali/bash-scripts/js-files
                        echo "******************************"
                fi
        else
                echo "File doesnt exist"
        fi
else
        echo "Filed cannot be empty"
fi

