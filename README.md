# OpenVPN-Setup-Script
A quick and painless script designed to setup your OpenVPN server in a flash!

__Current Supported Distros__
  * Red Hat Enterprise Linux
  * Debian
  * Ubuntu
  * CentOS
  * Gentoo

#Installation / Use

Running the setup is as simple as grabbing and executing the script which pertains to your distro of choice, the client creation is universal. 

#Important Note
This script although nearly 99.9999% effective, there are the odd system configurations where the Internet-facing interface is NOT eth0 and this script does not account for this, as a workaround it is recommended to check ifconfig before actually executing the script and apply changes as needed. ~~In an updated version of this script I will have the option to specify the interface during install~~ Setting the proper interface is now done through the script itself.
