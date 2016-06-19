#!/bin/bash

# Traffic Control
tc qdisc add dev eth0 root handle 1: htb default 12
tc class add dev eth0 parent 1:1 classid 1:12 htb rate 54mbps ceil 54mbps
tc qdisc add dev eth0 parent 1:12 netem delay 5ms

#tc qdisc add dev eth0 parent 1:12 netem loss 0%
#tc qdisc add dev eth0 parent 1:12 netem corrupt 0%
