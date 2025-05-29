sudo apt-get update -y

echo "Do you want to purge all existing NVIDIA drivers? (y/n)"
read purge_choice
if [ "n" != purge_choice ]; then
    echo "Purging existing NVIDIA drivers..."
    sudo apt-get remove --purge '^nvidia-.*'
    sudo apt-get remove --auto-remove nvidia-cuda-toolkit
    sudo apt-get --purge remove "*cublas*" "cuda*" "nsight*"

    echo "NVIDIA drivers purged successfully!"
fi

ubuntu-drivers devices

echo "Please select the NVIDIA driver version you wish to install (e.g., nvidia-driver-535), please refer the list of available driver versions above: (respond with 535 for nvidia-driver-535). Please note: the script currently supports only NVIDIA driver version 535."
read driver_version
echo "Please enter the Ubuntu version you are using (e.g., 2004 for Ubuntu 20.04):"
read ubuntu_version

if [[ "$driver_version" == "535" ]]; then
    if [[ "$ubuntu_version" == "2004" ]]; then
        echo "Installing NVIDIA driver version 535 for Ubuntu 20.04. Please wait..."
        sudo apt-get install -y nvidia-driver-$driver_version

        mkdir -p packages && cd packages
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
        sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2004-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2004-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2004-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
        sudo apt-get update
        sudo apt-get -y install cuda
    elif [[ "$ubuntu_version" == "2204" ]]; then
        echo "Installing NVIDIA driver version 535 for Ubuntu 22.04. Please wait..."
        sudo apt-get install -y nvidia-driver-$driver_version
        mkdir -p packages && cd packages
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
        sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
        sudo apt-get update
        sudo apt-get -y install cuda

    else
        echo "Unsupported Ubuntu version for NVIDIA driver 535. Please check the version and try again."
        exit 1
    fi
fi

echo "NVIDIA driver installed successfully!"
