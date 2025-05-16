#!/usr/bin/bash
RED='\033[0;31m'
NC='\033[0m'
if [[ ! -d ./g15 ]]; then
    mkdir g15
    cd g15 || exit
    echo -e "Installing dependencies...\n"
    sudo apt-get install -qq -y automake autotools-dev libusb-dev git
    echo -e "Cloning libg15...\n"
    git clone https://gitlab.com/menelkir/libg15.git && cd libg15 || exit
    echo -e "Building libg15...\n"
    ./configure && make && sudo make install
    cd .. || exit
    git clone https://gitlab.com/menelkir/g15daemon.git && cd g15daemon || exit
    ./configure && make && sudo make install
    cd .. || exit
else
    echo -e "${RED}[ERROR]:${NC} g15 directory already exists, cannot continue\n"
fi