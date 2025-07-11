#!/bin/zsh

# Update package list
sudo apt-get update -y

# Ask if user wants to purge existing NVIDIA drivers
echo -n "Do you want to purge all existing NVIDIA drivers? (y/n): "
read purge_choice

if [[ "$purge_choice" != "n" ]]; then
    echo "Purging existing NVIDIA drivers..."
    sudo apt-get remove --purge '^nvidia-.*' -y
    sudo apt-get remove --auto-remove nvidia-cuda-toolkit -y
    sudo apt-get --purge remove "*cublas*" "cuda*" "nsight*" -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
    echo "NVIDIA drivers purged successfully!"
fi

# Show available drivers
ubuntu-drivers devices

# Ask for driver version
echo -n "Enter the NVIDIA driver version you wish to install (e.g., 535 for nvidia-driver-535): "
read driver_version

# Ask for Ubuntu version
echo -n "Enter the Ubuntu version you are using (e.g., 2004 for Ubuntu 20.04): "
read ubuntu_version

# Install only if version is supported
if [[ "$driver_version" == "535" ]]; then

    echo "Installing NVIDIA driver version 535 for Ubuntu $ubuntu_version..."

    # Install driver
    sudo apt-get install -y nvidia-driver-$driver_version

    # Prepare packages directory
    mkdir -p packages && cd packages

    if [[ "$ubuntu_version" == "2004" ]]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
        sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2004-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2004-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2004-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/

    elif [[ "$ubuntu_version" == "2204" ]]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
        sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/

    else
        echo "Unsupported Ubuntu version: $ubuntu_version for driver 535"
        exit 1
    fi

    # Install CUDA
    sudo apt-get update
    sudo apt-get install -y cuda

    echo "NVIDIA driver and CUDA toolkit installed successfully!"

else
    echo "Unsupported driver version: $driver_version. Currently only 535 is supported."
    exit 1
fi
