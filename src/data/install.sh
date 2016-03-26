#!/bin/sh

# This file is part of ARAutoConnect.
#
# ARAutoConnect is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ARAutoConnect is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ARAutoConnect.  If not, see <http://www.gnu.org/licenses/>.



# default settings
SCRIPT_NAME=ARAutoConnect.sh
ESSID=ARAutoConnect
IP=192.168.1.1 
NETMASK=255.255.0.0

INSTALL_PATH=/home/default/ARAutoConnect

# creating the target directory
mkdir -p $INSTALL_PATH

# moving the script and the uninstall script to the target directory
mv $SCRIPT_NAME $INSTALL_PATH/$SCRIPT_NAME
mv uninstall.sh $INSTALL_PATH/uninstall.sh


# creating config files
echo "$ESSID" > $INSTALL_PATH/essid
echo "$IP" > $INSTALL_PATH/ip
echo "$NETMASK" > $INSTALL_PATH/netmask

# adding a line to /bin/wifi_setup.sh to launch the script
if [ -s $INSTALL_PATH/$SCRIPT_NAME ] ; then
    
    # checking if  wifi_setup.sh has already been modified
    if cat /bin/wifi_setup.sh | grep -q $SCRIPT_NAME ; then
          echo "Wifi_setup.sh has already been modified. Please perform a clean manual uninstall."
    else
          cp /bin/wifi_setup.sh /bin/wifi_setup.sh.bak
          cp /bin/wifi_setup.sh $INSTALL_PATH/wifi_setup.sh.bak
          echo "$INSTALL_PATH/$SCRIPT_NAME &" >> /bin/wifi_setup.sh
    fi
else
	echo "Script does not exists"
fi

# removing temporary files
rm -r /data/video/ARAutoConnect

# syncing filesytem to be sure that our modifications will survive a reboot
sync