#!/bin/bash

echo -n "Enter a name for your client: "
read CLIENT

if [[ -z "$CLIENT" ]] ; then
  echo "You must specify a client name to continue"
  exit 1
fi

curl icanhazip.com
echo -n "Enter the address specified above:"
read IP

cd /etc/openvpn/easy-rsa
./build-key $CLIENT
cd keys
wget http://pastebin.com/raw.php?i=kxxvGtVH
mv raw.php?i=kxxvGtVH "$CLIENT".ovpn
echo "remote $IP 1194" >> "$CLIENT".ovpn
echo "<ca>" >> "$CLIENT".ovpn
cat server.ca >> "$CLIENT".ovpn
echo "</ca>" >> "$CLIENT".ovpn
echo "<cert>" >> "$CLIENT".ovpn
cat "$CLIENT".cert >> "$CLIENT".ovpn
echo "</cert>" >> "$CLIENT".ovpn
echo "<key>" >> "$CLIENT".ovpn
cat "$CLIENT".key >> "$CLIENT".ovpn
echo "</key>" >> "$CLIENT".ovpn
echo "Client setup is complete, you can find your key at "$CLIENT".ovpn"
