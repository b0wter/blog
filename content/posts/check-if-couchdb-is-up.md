+++
title = "Use a script to check if a CouchDb server is available"
date = "2019-10-01T08:51:02.932"
author = "b0wter"
cover = ""
tags = ["infrastructure", "shell", "bash"]
description = "Learn how to check if a CouchDb server is available using bash scripting."
showFullContent = false
+++

# Goal
CouchDb can take some time to start, especiallay if it is run inside a docker container. It usually takes 1-2 minutes because the container checks and modifies file permissions each time it is started. Usually, I don't want to look at the terminal that long and do nothing. 

# Solution
Create a script that periodically querrys the `/_up` endpoint of CouchDb until it gets a status code 200 response.

# Script
```bash
#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
        echo "Usage: up-test.sh <host> <port> [command]"
        echo ""
        echo "All arguments after <port> will be used to run as a new comand."
        echo "This is useful if you want to send a message or beep after the database is available."
        exit
fi

[ -z "$1" ] && echo "You need to supply the hostname as first parameter." && exit 1
[ -z "$2" ] && echo "You need to supply the port as second parameter." && exit 1

HOST="$1"
PORT="$2"
COMMAND="${@:3}"

STATUSCODE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$HOST:$PORT/_up)

while [ "$STATUSCODE" -ne 200 ]
do
        printf '%s' "." 
        sleep 10
        STATUSCODE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://localhost:5984/_up)
done

echo "CouchDb is now available!"

if [ -z "$COMMAND" ]; then
        # nothing to do
        NOTHING="NOTHING"
else
        $COMMAND
fi
```
There is nothing fancy about this script. It simply checks that at lease two parameters are given and uses `curl` to send a GET request to the server. It will do so until it get a successful response.

The script also allows the user to supply a command that will be run once the test is completed. Use it with caution! Usually, I only use it to send push notifications to my phone using pushover.

