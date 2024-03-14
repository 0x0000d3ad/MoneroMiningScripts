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

./xmrig --donate-level 0 -o pool.supportxmr.com:443 -u 4A4tgkWPxYiAzwUmMDzrXkZ1p5a8aacmSdqniMYTgQN7FX9wajLDvtxDHp7tXJsJHANAcadruP8Cmgx4qgAcSVP84iTaPMA -k --tls -p `hostname`
