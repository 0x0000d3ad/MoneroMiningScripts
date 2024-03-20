sudo apt-get update && sudo apt-get upgrade -y
sudo apt install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev build-essential
git clone https://0x0000d3ad/cpuminer-multi
cd cpuminer-multi
sudo ./autogen.sh
sudo ./configure
sudo ./build.sh
