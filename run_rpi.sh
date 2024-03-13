#!/bin/bash

###########################################################################
#
# name		: run.sh
#
# purpose	: run monero miner
#
# usage		: ./run.sh
#
# description	:
#
###########################################################################

./cpuminer -a cryptonight -o stratum+tcp://pool.supportxmr.com:8080 -u 4A4tgkWPxYiAzwUmMDzrXkZ1p5a8aacmSdqniMYTgQN7FX9wajLDvtxDHp7tXJsJHANAcadruP8Cmgx4qgAcSVP84iTaPMA -p "rpi miner"
