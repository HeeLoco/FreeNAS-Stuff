#!/bin/bash

# Create a small ramdrive to store our recovery keys temporarily
mkdir /mnt/ramfs
mdmfs -s 1m md /mnt/ramfs

# Send our unlock/mount script to the pi and execute it on the pi using ssh
ssh User@"IP" 'bash -s' < /root/auto-mount/mount-secure.sh

# Now the pi will have mounted the secure area, we can go and grab the two keys we need
scp User@"IP":/mnt/secure/MyKey.key /mnt/ramfs

# Send our unmount/lock script to the pi and execute it on the pi using ssh
ssh -User@"IP" 'bash -s' < /root/auto-mount/unmount-secure.sh

# So, at this point our recovery keys are in RAM on FreeNAS
# and the secure area on the has been closed, so the keys are safe on the Pi

# Now we need to execure our Python scripts to use the API to unlock our volumes
/usr/local/bin/python /root/auto-mount/openVolumeXY.py

# Now that we have unlocked the volumes, lets unmount the ramdrive
umount /mnt/ramfs

# Finally, now that the pools have been unlocked lets restart Samba
# (This is the only service I use, but you might need to restart others on your setup.)
#service samba_server restart
