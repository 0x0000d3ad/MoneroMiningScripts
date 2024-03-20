cd ~/
apt-get update && apt-get upgrade -y
apt install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev build-essential net-tools -y
cd ~/
git clone https://0x0000d3ad/cpuminer-multi
cd cpuminer-multi
./autogen.sh
./configure
./build.sh
./run.sh
