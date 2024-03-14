# Introduction

This repo features mining scripts for Mac, Linux and Windows.  Note that this is only a collection of scripts and shortcuts, summarizing the steps for these platforms.  Full credit is given to the original authors, where applicable.  See the [Resources](#Resources) section for more. 

Feeling generous?  Donate Monero to this address:

```4A4tgkWPxYiAzwUmMDzrXkZ1p5a8aacmSdqniMYTgQN7FX9wajLDvtxDHp7tXJsJHANAcadruP8Cmgx4qgAcSVP84iTaPMA```

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

8. Copy `run.sh` into the excecutable directory and run it

```bash
./run.sh
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

7. Copy `run.sh` into the excecutable directory and run it

```bash
./run.sh
```

## Windows

1. Download the executable [here](https://github.com/fireice-uk/xmr-stak/releases).

2. Unpack the Zip file

3. Copy `run.bat` into the executables directory and run it

```bash
run.bat
```

## Raspberry Pi

[This article](https://raspberrytips.com/mine-monero-raspberry-pi/) describes getting xmrig set up on Raspberry Pi, but we summarize the steps below. 

1. Update package manager

```bash
sudo apt-get update; sudo apt-get upgrade -y
```

2. Install dependencies (this may take a while)

```bash
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
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
cmake ..
```

6. Run Make

```bash
make -j$(nproc)
```

7. Copy `run.sh` into the excecutable directory and run it

```bash
./run_rpi.sh
```

# Resources 

1. [Mining on Linux](https://www.maketecheasier.com/mine-monero-linux/)
2. [Mining on Mac](https://nnekrut.netlify.app/posts/lets-kill-this-macbook-how-to-mine-monero-on-a-mac/)
3. [Mining on Raspberry Pi](https://raspberrytips.com/mine-monero-raspberry-pi/)
4. [XMR miner](https://github.com/fireice-uk/xmr-stak/releases)
6. [Miner pool](http://moneropools.com/)
7. [Another Miner Pool](https://supportxmr.com/)
8. [Swapping](https://letsexchange.io/)
9. [Mining Article (doesn't open as of 2024-03-13)](https://www.monero-miner.info/2020/05/mine-monero-without-fees.html)
10. [Mining Article (doesn't open as of 2024-03-13)](https://www.pinode.co.uk/monero-node-for-pi-3-or-armv7-devices-no-lcd-display.html)
