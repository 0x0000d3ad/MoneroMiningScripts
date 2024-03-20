# Introduction

This repo features mining scripts for Linux, Mac, Windows, and Raspberry Pi (Ubuntu).  Note that this is only a collection of scripts and shortcuts, summarizing the steps for these platforms.  Full credit is given to the original authors, where applicable.  See the [Resources](#Resources) section for more. 

Feeling generous?  Donate Monero to this address:

```4A4tgkWPxYiAzwUmMDzrXkZ1p5a8aacmSdqniMYTgQN7FX9wajLDvtxDHp7tXJsJHANAcadruP8Cmgx4qgAcSVP84iTaPMA```

# Setup

Some niceties to streamline mining include:

1. Setting a static IP for each miner
2. Setting a hostname to identify each miner
3. Mine on start-up

We will cover each of these steps for Linux.

## Static IP

To set a static IP in Linux, see [this article](https://learnubuntu.com/set-static-ip/), summarized below in the following steps:

1. Create and edit the file `sudo vim /etc/cloud/cloud.cfg.d/99-disable-cloud-init.cfg`, adding the following contents:

```bash
network: {config: disabled}
```

2. Edit the yaml file in `/etc/netplan`, updating the contents to the following (filling in your own information for the ethernet adapter, address and gateway)

```bash
network:
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.122.128/24
      gateway4: 192.168.122.1
  version: 2
```

3. Apply changes:

```bash
sudo netplan apply
```

4. You may have to invoke dhclient ```sudo dhclient eth0```

## Hostname

[This article](https://linuxconfig.org/how-to-change-hostname-on-linux) sums up changing the hostname in Linux, by running the following command (enter your node name for `node001`):

```bash
sudo hostnamectl set-hostname node001
```

## Mine on Startup

To mine on [startup](https://phoenixnap.com/kb/crontab-reboot), invoke `crontab -e`, then enter a line for your script as follows:

```bash
@reboot /path/to/script/mine.sh
```

**Note**: If your script [requires root priviledges](https://askubuntu.com/questions/419548/how-to-set-up-a-root-cron-job-properly), invoke `sudo crontab -e` instead of `crontab -e`.

An example script might look like:

```bash
dhclient eth0
cd ~/mining/directory
run.sh
```

# Installation

## Linux

Steps for installing on Linux:

1. Update package manager

```bash
sudo apt-get update; sudo apt-get upgrade -y
```

2. Install dependencies

```bash
sudo apt-get install git build-essential cmake automake libtool autoconf
```

3. Clone the repo

```bash
git clone https://github.com/xmrig/xmrig.git
```

4. Make build and scripts directory

```bash
mkdir xmrig/build && cd xmrig/scripts
```

5. Run build dependency script

```bash
./build_deps.sh && cd ../build
```

6. Run CMake

```bash
cmake .. -DXMRIG_DEPS=scripts/deps
```

7. Run Make

```bash
make -j$(nproc)
```

8. Copy [run.sh](./mac/run.sh) into the excecutable directory, set permissions and run it

```bash
chmod 777 run.sh; ./run.sh
```

## Mac

Follow the instructions [here](https://nnekrut.netlify.app/posts/lets-kill-this-macbook-how-to-mine-monero-on-a-mac/).  They're summed up below:

1. Install homebrew if you don't have it already

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

2. Install dependencies (this may take a while)

```bash
brew install git cmake libuv libmicrohttpd openssl hwloc
```

3. Clone the repo

```bash
git clone https://github.com/xmrig/xmrig.git
```

4. Make the build directory and cd into it

```bash
mkdir xmrig/build && cd xmrig/build
```

5. Run CMake

```bash
cmake .. -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl
```

6. Run Make

```bash
make -j$(sysctl -n hw.logicalcpu)
```

7. Copy [run.sh](./mac/run.sh) into the excecutable directory, set permissions and run it

```bash
chmod 777 run.sh; ./run.sh
```

## Windows

1. Download the executable [here](https://github.com/fireice-uk/xmr-stak/releases).

2. Unpack the Zip file

3. Copy [run.bat](./windows/run.bat) into the executables directory and run it

```bash
run.bat
```

## Raspberry Pi

[This article](https://raspberrytips.com/mine-monero-raspberry-pi/) describes getting xmrig set up on Raspberry Pi, but the application seg faulted.  Instead of debugging why, I used [cpuminer](https://www.tomshardware.com/how-to/mine-cryptocurrency-raspberry-pi).  After some modifications to the code, it worked.  I forked cpuminer [here](https://github.com/0x0000d3ad/cpuminer-multi) with the changes that fixed the compiler error.  The linked article explains installation in detail, but it is summarized below along with what didn't work and what I did to fix it.

1. Update package manager

```bash
sudo apt-get update; sudo apt-get upgrade -y
```

2. Install dependencies (this may take a while)

```bash
sudo apt install git automake autoconf libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev build-essential -y
```

3. Clone the repo

```bash
git clone https://github.com/0x0000d3ad/cpuminer-multi
```

4. cd into the directory 

```bash
cd cpuminer-multi
```

5. Compile the mining code

```bash
sudo ./autogen.sh
sudo ./configure
sudo ./build.sh
```

6. **Note**: here is where I encountered some errors (which have been corrected in the above steps):
    - No compiler found.  **Solution**: [GCC](https://linuxize.com/post/how-to-install-gcc-on-ubuntu-20-04/) was installed.
    - Got a [compiler error](https://github.com/openwall/john/issues/5351): `'blake2b_state isn't a multiple of its alignment'`.  **Solution**: Had to fix the C code manually (code repo in step 3 contains the fix for this).
    - A compiler error had an issue with the `-lz` flag.  **Solution**: Initially, I removed the flag entirely from the build script, however installing [zlib1g-dev](https://itsfoss.com/install-zlib-ubuntu/) fixed the problem.

7. Copy [run.sh](./raspberry_pi/run.sh) into the excecutable directory, set permissions and run it

```bash
chmod 777 run.sh; ./run.sh
```

# Resources 

1. [Mining on Linux](https://www.maketecheasier.com/mine-monero-linux/)
2. [Mining on Mac](https://nnekrut.netlify.app/posts/lets-kill-this-macbook-how-to-mine-monero-on-a-mac/)
3. [Mining on Windows](https://github.com/fireice-uk/xmr-stak/releases)
4. [Mining on Raspberry Pi with cpuminer](https://www.tomshardware.com/how-to/mine-cryptocurrency-raspberry-pi)
5. [Mining on Raspberry Pi with xmrig (segfaulted)](https://raspberrytips.com/mine-monero-raspberry-pi/)
6. [cpuminer compiler error](https://github.com/openwall/john/issues/5351)
7. [Miner pool](http://moneropools.com/)
8. [Another Miner Pool](https://supportxmr.com/)
9. [Swapping](https://letsexchange.io/)
10. [Mining Article (doesn't open as of 2024-03-13)](https://www.monero-miner.info/2020/05/mine-monero-without-fees.html)
11. [Mining Article (doesn't open as of 2024-03-13)](https://www.pinode.co.uk/monero-node-for-pi-3-or-armv7-devices-no-lcd-display.html)
12. [Setting a static IP on Linux](https://learnubuntu.com/set-static-ip/)
13. [Setting hostname on Linux](https://linuxconfig.org/how-to-change-hostname-on-linux)
14. [Running a cron job as root](https://askubuntu.com/questions/419548/how-to-set-up-a-root-cron-job-properly)
15. [Cron tasks on startup](https://phoenixnap.com/kb/crontab-reboot)
16. [Installing GCC](https://linuxize.com/post/how-to-install-gcc-on-ubuntu-20-04/)
17. [Installing zlib](https://itsfoss.com/install-zlib-ubuntu/)
