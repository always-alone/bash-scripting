
#!/bin/bash

echo "Enter the network"
read network

echo "First host"
read first

echo "Enter the last"
read last
rm -rf /home/kali/bash-script/userlist

if [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        cat /etc/passwd | cut -d "1" -f1 1>/home/kali/bash-scripts/userlist
        for ip in $(seq $first $last)
        do
        ping -c 1 $network.$ip | grep "64 bytes" | cut -d " " -f4 | cut -d ":" -f1 >> /home/>
        done
        echo "Wait for 5 seconds"
        sleep 5
        if [ -s /home/kali/bash-scripts/responding ]
        then
                for response in $(cat /home/kali/bash-scripts/responding )
                do
                        echo "Host is alive: $response"
                done
        else
                echo "No host is alive"
        fi
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
