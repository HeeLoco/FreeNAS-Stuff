#!/bin/bash

while true
do
        echo "send simple echo command to test connection"
        ssh LoginUser@13.95.110.81 'echo "Hello!"'
        if [ $? -eq 0 ]
        then
                break
        fi
        sleep 5
done

echo "success!"
