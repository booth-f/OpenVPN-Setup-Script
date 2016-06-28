# OpenVPN-Setup-Script
A quick and painless script designed to setup your OpenVPN server in a flash!


A Simple way to get an OpenVPN server up without having to do much work.
Currently this script only supports Debian, Ubuntu, Gentoo, CentOS, and Red Hat installs but it can be adapted to work with other distributions if need be.


#Installation / Use

Running the setup is as simple as grabbing and executing the script which pertains to your distro of choice, the client creation is universal. 

#Important Note
This script although nearly 99.9999% effective, there are the odd system configurations where the Internet-facing interface is NOT eth0 and this script does not account for this, as a workaround it is recommended to check ifconfig before actually executing the script and apply changes as needed. In an updated version of this script I will have the option to specify the interface during install.
