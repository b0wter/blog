+++
title = "Use a script to send push notifications to your phone"
date = "2019-10-01T08:54:19.931"
author = "b0wter"
cover = ""
tags = ["infrastructure", "shell", "bash"]
description = "Learn how to send push notifications to your phone using pushover.net and bash."
showFullContent = false
+++

# Goal
Sometime I run commands that take quite some time to finish. Since I carry my phone most of the time I'd like a way to receive a push notification once the command has finished. Turns it is easier than I thought. Note, I am using pushover.net whose phone app is paid. There are plenty of other services around that allow you to do the same thing for free. I suggest you check out [pushbullet](https://pushbullet.com).

# Script

```bash
#!/bin/bash
APP_TOKEN="<<<INSERT YOUR APP TOKEN HERE>>>"
USER_TOKEN="<<<INSERT YOUR USER TOKEN HERE>>>"

if [ $# -eq 0 ]; then
        echo "Usage: ./push [--title=...] <message>"
        echo ""
        echo "If your title is longer than a single word you need to quote it."
        echo "The title needs to be the FIRST argument you pass."
        echo "All remaining arguments will be sent to the pushover api as a single message."
        echo ""
        exit
fi

case $1 in
        -t=*|--title=*)
        TITLE="${1#*=}"
        MESSAGE="${@:2}"
        ;;
        *)
        MESSAGE="$@"
        TITLE=""
        ;;
esac

if [ -z "$TITLE" ]; then
        TITLE="`whoami`@${HOSTNAME}"
fi

wget https://api.pushover.net/1/messages.json --post-data="token=$APP_TOKEN&user=$USER_TOKEN&message=$MESSAGE&title=$TITLE" -qO- > /dev/null 2>&1 &
```
After creating a pushover.net account you can create a new app in the webinterface and retrieve your `APP_TOKEN` as well as your `USER_TOKEN`.
