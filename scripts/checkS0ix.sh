#!/bin/bash

cd /var/tmp/
acpidump -b
iasl -d *.dat
lp=$(grep "Low Power S0 Idle" /var/tmp/facp.dsl | awk '{print $(NF)}')

if [ "$lp" -eq 1 ]; then
        echo "Low Power S0 Idle is" $lp
        echo "The system supports S0ix!"
else
        echo "Low Power S0 Idle is" $lp
        echo "The system does not support S0ix!"
fi
