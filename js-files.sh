#!/bin/bash
#Name: Hrishikesh Ghosalkar
#Bash-Script: To find JavaScript files 
#For OSCP lab excerises

echo "Enter the file location: ABSOLUTE PATH"
read location

echo "*******Files Found*******"
ls -l $file 2>/dev/null
echo "*******Files Found*******"

echo "Enter the file name"
read file

rm -rf /home/kali/bash-scripts/js-files
if [ -n "$locatin$file" ]
then
        if [ -f "$location$file" ]
        then
                echo "Trying to find JavaScript Files in $ilocation$file"
                cat $location$file | cut -d "/" -f5 | grep -i ".js" | cut -d " " -f1 | sort | uniq 1> /home/kali/bash-scripts/js-files

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
