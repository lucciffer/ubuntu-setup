ifconfig

echo "Enter the static IP address you want to set (e.g., 10.2.0.100):"
read static_ip
echo "Enter the gateway/subnet mask address (e.g., 255.255.252.0):"
read gateway
echo "Enter the DNS server address (e.g., 8.8.8.8):"
read dns_server
echo "Enter the network interface name (e.g., eth0):"
read interface_name
echo "Configuring static IP address..."

sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bak
sudo bash -c "cat > /etc/netplan/01-netcfg.yaml" <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    $interface_name:
      dhcp4: no
      addresses:
        - $static_ip/22
      gateway4: $gateway
      nameservers:
        addresses:
          - $dns_server
EOF

sudo chmod 0600 /etc/netplan/00-installer-config.yaml

sudo netplan apply
ifconfig
echo "Static IP address configured successfully!"


