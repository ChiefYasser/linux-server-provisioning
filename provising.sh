#!/bin/bash
# 1. Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo "Error: Please run this script as root."
  exit 1
fi

USERNAME="sysadmin"
PASSWORD=${1:-"ChangeMe@123"} 

echo "--- Starting Provisioning Process ---"

# 3. Update the System
echo "--- Updating System Packages (this may take time) ---"
dnf update -y

# 4. Install Essential Tools
echo "--- Installing Basic Tools (vim, curl, net-tools, epel-release) ---"
dnf install -y vim curl net-tools epel-release

# 5. Create SysAdmin User
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists. Skipping creation."
else
    echo "--- Creating User: $USERNAME ---"
    useradd -m $USERNAME
    echo "$USERNAME:$PASSWORD" | chpasswd
    usermod -aG wheel $USERNAME
    echo "User '$USERNAME' created and added to wheel (sudo) group."
fi

# 6. Configure Basic Firewall
echo "--- Configuring Firewall ---"
systemctl start firewalld
systemctl enable firewalld

# Allow SSH connections
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload

# 7. Set Timezone (UTC)
echo "--- Setting Timezone to UTC ---"
timedatectl set-timezone UTC

echo "--- Provisioning Complete! ---"
echo "Sysadmin user created."
echo "Please reboot the system to ensure all updates apply."