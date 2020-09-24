#!/bin/bash

echo "Enter the username"
read username

echo "Enter the password"
read password

retry=1

if [ -n "$username" ] && [ -n "$password" ]
then
        if [ "$username" == "admin" ] && [ "$password" == "password" ]
                then
                        echo "login success"
                else
                        while [ $retry -lt 3 ]
                        do
                                echo "Username or password incorect"
                                echo "Enter the username"
                                read username

                                echo "Enter the password"
                                read password
                                if [ "$username" == "admin" ] && [ "$password" == "password" ]
                                then
                                        echo "login success"
                                        break
                                else
                                        ((retry++))
                                fi
                        done
                fi
else
        echo "username and password field cannot be empty"
fi
--------------------------------------------------------------------------------------------------------------------------------------------------------------
With Functions 
#!/bin/bash

hrishi() {

        echo "Enter the username"
        read username

        echo "Enter the password"
        read password
}
hrishi

retry=1

if [ -n "$username" ] && [ -n "$password" ]
then
        if [ "$username" == "admin" ] && [ "$password" == "password" ]
                then
                        echo "login success"
                else
                        while [ $retry -lt 3 ]
                        do
                                echo "Username or password incorect"
                                hrishi
                                if [ "$username" == "admin" ] && [ "$password" == "password" ]
                                then
                                        echo "login success"
                                        break
                                else
                                        ((retry++))
                                fi
                        done
                fi
else
        echo "username and password field cannot be empty"
fi


