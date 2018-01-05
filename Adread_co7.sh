#!/bin/bash

echo "*******************************************************************"
echo "*		name		Adread_co7.sh Ver. 0.1.4		*"
echo "*		author		Julien Deseke-Wendt,			*"
echo "*				GNS Systems GmbH, Braunschweig		*"
echo "*									*"
echo "*		created		We 11. Jan 12:46:28 CET 2017		*"
echo "*		last change	Th 12. Jan 13:43:55 CET 2017		*"
echo "*		description	Installation of Adobe Reader 9.5.5	*"
echo "*				on CentOS 7.3 32bit, 64bit		*"
echo "*									*"
echo "*******************************************************************"

# you have to be root, otherwise you can't install applications
	if [ "$(whoami)" = "root" ]; then

		# install nux-desktop repo and Adobe Reader
		# on x86_64 bit system, 32-bit dependencies is also installed.
		echo "We are now ready to install"

		read -p"Would you like to continue? (y/N)? " response

			if [ "$response" == "y" ]; then
		
				
				# Download the Adobe Reader Package from adobe.com
				curl -o AdbeRdr9.5.5-1_i486linux_enu.rpm http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i486linux_enu.rpm

				# install nux-desktop repo and Adobe Reader
				yum localinstall -q -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
				yum localinstall -q -y AdbeRdr9.5.5-1_i486linux_enu.rpm libcanberra-gtk2.i686 adwaita-gtk2-theme.i686 PackageKit-gtk3-module.i686

				# Remove nux-desktop repo from target
				rm -f /etc/yum.repos.d/nux-dextop

				echo "All done. Thank you for using. Have a nice day..."
			fi
	
	else
		echo "You have to be root to execute this script. Please start over."
fi
