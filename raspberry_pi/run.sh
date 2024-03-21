#!/bin/bash

###########################################################################
#
# name		: run.sh
#
# purpose	: run miner
#
# usage		: ./run.sh
#
# description	:
#
###########################################################################

cd /home/daniel/cpuminer-multi
dhclient eth0
./cpuminer -a cryptonight -o stratum+tcp://cryptonight_upx.na.mine.zergpool.com:4457 -u DSvMzJQvThSCZwKwLBpiLuHSK6ce7LaESj -p c=DOGE,mc=UPX,ID=$HOSTNAME
