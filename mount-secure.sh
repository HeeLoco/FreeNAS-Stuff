#!/bin/bash
#add here the desired passphrase
echo -n "LUKSPASSPHRASE" | sudo cryptsetup luksOpen ~/secure.luks secure -d -
sudo mount /dev/mapper/secure /mnt/secure
