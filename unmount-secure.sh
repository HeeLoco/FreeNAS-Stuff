#!/bin/bash
sudo umount /mnt/secure
sudo cryptsetup luksClose secure
