#!/bin/bash
#oscp excerise
#author: Hrishi Ghosalkar
#bash script: to check which host i.e the IP address responds to the icmp ping. 
#displays the list of host, if they respond back 

echo "Enter the nework: Example 1.1.1"
read network

echo "Enter the first host"
read first

echo "Enter Last host"
read last

if [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        echo "Checking host"
        for host in $(seq $first $last)
        do
                ping -c 1 $network.$host | grep "64 bytes" | cut -d " " -f4 | cut -d >
        done
        sleep 5
        
        if [ -s "/home/kali/bash-scripts/host-responding" ]
        then
                for hosts in $(cat /home/kali/bash-scripts/host-responding)
                do
                        echo "Host is alive: $hosts"
                done
        else
                echo "No host found alive"
        fi
elif [ -z "$network" ] && [ \( -n "$first" -a -n "$last" \) ]
then
        echo "Network field cannot be empty"
elif [ -z "$first" ] && [ \( -n "$network" -a -n "$last" \) ]
then
        echo "first field cannot be empty"
elif [ -z "$last" ] && [ \( -n "$network" -a -n "$first" \) ]
then
        echo "Last field cannot be empty"
else
        echo "All fields cannot be empty"
fi
rm -rf /home/kali/bash-scripts/host-responding

