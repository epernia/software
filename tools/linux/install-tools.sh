#!/bin/bash

# check for root
U=$(id -u)
echo "Execute as user $U"
if [ $U -ne 0 ]; then
    echo "Re-exec as root..."
    tmpFile=$(tempfile -m 0755 -p install-tools_ -s .sh)
    SELF=$(readlink -f $0)
    cat $SELF > $tmpFile
    pkexec $tmpFile $1
    rm $tmpFile
    exit 0
fi

# Do the rest                                         CIAABOT v
apt-get -y install gtkterm cutecom git gitk git-email libgconf2-4
adduser $USER dialout
bash "${1}/embedded-ide/usr/bin/ftdi-tools.sh" --install

