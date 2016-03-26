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



INSTALL_PATH=/home/default/ARAutoConnect

# restoring wifi_setup.sh
if [ -s /bin/wifi_setup.sh.bak ] ; then
	mv /bin/wifi_setup.sh.bak /bin/wifi_setup.sh
	
	# removing ARAutoConnect
    rm -r $INSTALL_PATH

else

echo "wifi_setup.sh backup unavailable"	

fi

