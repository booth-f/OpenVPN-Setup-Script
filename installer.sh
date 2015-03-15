#Created for Debian Derived Systems
#Will be updated for more systems later

if [[ "$USER" != 'root' ]]; then
echo "This script must be run as root."
exit
fi

echo "This script will set up OpenVPN as well as properly set the configuration and vars file for signing your keys."

echo -n "Country [Ex: US]: "
read KEY_COUNTRY

if [[ -z "$KEY_COUNTRY" ]] ; then
echo "Defaulting to US"
export KEY_COUNTRY="US"
fi

echo -n "State [Ex: CA]: "
read KEY_PROVINCE

if [[ -z "$KEY_PROVINCE" ]] ; then
echo "Defaulting to CA"
export KEY_PROVINCE="CA"
fi

echo -n "City [Ex: SanFrancisco]: "
read KEY_CITY

if [[ -z "$KEY_CITY" ]] ; then
echo "Defaulting to SanFrancisco"
export KEY_CITY="SanFrancisco"
fi

echo -n "Organization [Ex: Fort-Funston]: "
read KEY_ORG

if [[ -z "$KEY_ORG" ]] ; then
echo "Defaulting to Fort-Funston"
export KEY_ORG="Fort-Funston"
fi

echo -n "Email [Ex: me@myhost.mydomain]: "
read KEY_EMAIL

if [[ -z "$KEY_EMAIL" ]] ; then
echo "Defaulting to me@myhost.mydomain "
export KEY_EMAIL="me@myhost.mydomain"
fi

echo -n "Organization Unit [Ex: Information Technology]: "
read KEY_OU

if [[ -z "$KEY_OU" ]] ; then
echo "Defaulting to Information Technology"
export KEY_OU="Information Technology"
fi

apt-get install openvpn
cd /etc/openvpn/
wget http://pastebin.com/raw.php?i=bHW1uj8i
mv raw.php?i=bHWiuj8i server.conf
wget https://github.com/OpenVPN/easy-rsa/releases/download/2.2.2/EasyRSA-2.2.2.tgz
tar -xf EasyRSA-2.2.2.tgz
mv EasyRSA-2.2.2 easy-rsa
cd easy-rsa
rm -rf vars
wget http://pastebin.com/raw.php?i=qgCiesAF
mv raw.php?i=ggCiesAF vars
echo "export KEY_COUNTRY="$KEY_COUNTRY >> vars 
echo "export KEY_PROVINCE="$KEY_PROVINCE >> vars
echo "export KEY_CITY="$KEY_CITY >> vars 
echo "export KEY_ORG="$KEY_ORG >> vars 
echo "export KEY_EMAIL="$KEY_EMAIL >> vars 
echo "export KEY_OU="$KEY_OU >> vars 
source ./vars
./clean-all
./build-ca
./build-key-server server
./build-dh
cd keys
cp dh2048.pem ca.crt server.crt server.key /etc/openvpn
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Installation Complete, your server should be all set up and ready to accept clients."
echo ""
echo "To generate your client keys use the client creation script"
