#!/bin/bash
#Enter the network field 
echo "Enter the network"
read network

#Enter the first host  
echo "First host"
read first

#Enter the last host 
echo "Enter the last"
read last

#Delete any existing file
rm -rf /home/kali/bash-scripts/responding

if [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        for ip in $(seq $first $last)
        do
        #ping the host and save the standard output to a file. 
        ping -c 1 $network.$ip | grep "64 bytes" | cut -d " " -f4 | cut -d ":" -f1 >> /home/kali/bash-scripts/responding &
        done
        echo "Wait for 5 seconds"
        sleep 5
        
        #if the file exist and not empty
        if [ -s /home/kali/bash-scripts/responding ]
        then
                for response in $(cat /home/kali/bash-scripts/responding )
                do
                        echo "Host is alive: $response"
                done
        else
                echo "No host is alive"
        fi
        
#any user input missing 
elif [ -z "$network" ] || [ -z "$first" ] ||  [ -z "$last" ]
then
        if [ -z "$network" ] && [ \( -n "$first" -a -n "$last" \) ]
        then
                echo "Network field cannot be empty"
        elif [ -z "$first" ] && [ \( -n "$network" -a -n "$last" \) ]
        then
                echo "First host field cannot be empty"
        elif [ -z "$last" ] && [ \( -n "$network" -a -n "$first" \) ]
        then
                echo "last host field cannot be empty"
        else
                echo "Most of the input field are missing"
        fi
fi
