sudo apt-get update && sudo apt-get upgrade -y
sudo apt install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev 
git clone https://carolinedunn/cpuminer-multi
cd cpuminer-multi
sudo ./autogen.sh
sudo ./configure
sudo ./build.sh
