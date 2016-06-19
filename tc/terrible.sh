#!/bin/bash

# Traffic Control
tc qdisc add dev eth0 root tbf limit 15Kb buffer 10Kb/8 rate 300Kbit
tc qdisc add dev eth0 root netem delay 100ms 10ms
tc qdisc add dev eth0 root netem loss 10%
tc qdisc add dev eth0 root netem corrupt 10%
