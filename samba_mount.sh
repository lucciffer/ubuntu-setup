#!/bin/bash

# --- CONFIGURATION ---
# Replace these with your actual details
SAMBA_USER="cvg-shared"
SAMBA_PASS="cvg#xr"
SAMBA_DOMAIN="WORKGROUP"  # Change if your server uses a specific domain
REMOTE_PATH="//10.9.0.114/cvg-archive/NTIRE2026"
MOUNT_POINT="/NTIRE2026"
CREDS_FILE="/etc/samba/.cvgarch_creds"

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)"
   exit 1
fi

echo "1. Installing cifs-utils..."
apt update && apt install -y cifs-utils

echo "2. Creating mount directory at $MOUNT_POINT..."
mkdir -p "$MOUNT_POINT"

echo "3. Creating credentials file at $CREDS_FILE..."
mkdir -p /etc/samba
cat <<EOF > "$CREDS_FILE"
username=$SAMBA_USER
password=$SAMBA_PASS
domain=$SAMBA_DOMAIN
EOF

# Set secure permissions (only root can read/write)
chmod 600 "$CREDS_FILE"

echo "4. Adding entry to /etc/fstab for persistence..."
# Check if the entry already exists to avoid duplicates
if ! grep -q "$REMOTE_PATH" /etc/fstab; then
    echo "$REMOTE_PATH $MOUNT_POINT cifs credentials=$CREDS_FILE,uid=1001,gid=1001,file_mode=0770,dir_mode=0770,iocharset=utf8,vers=3.0,nounix 0 0" >> /etc/fstab
    echo "Added to /etc/fstab."
else
    echo "Entry already exists in /etc/fstab. Skipping."
fi

echo "5. Mounting the share..."
mount -a

if mountpoint -q "$MOUNT_POINT"; then
    echo "SUCCESS: $REMOTE_PATH is mounted at $MOUNT_POINT"
else
    echo "ERROR: Mount failed. Check 'dmesg | tail' for details."
fi