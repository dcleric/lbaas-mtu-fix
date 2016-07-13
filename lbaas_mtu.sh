#!/bin/bash
MTU=1450
for instance in `ip netns | grep qlbaas`
do
        if [ `ip netns exec $instance ip link | grep -e 'ns-' | grep -e "mtu 1500" | wc -l` -gt 0 ]
             then
               ip netns exec $instance ip link set mtu $MTU dev `ip netns exec $instance ip link | grep 'ns-' | awk '$2 ~ /ns-/ && /mtu 1500/ { print substr($2, 1, length($2)-1) }'`
               echo 'Setting MTU 1450 to NS interfaces of lbaas' 
        else
               echo 'NS interfaces are already set to mtu 1450; exiting'       
               exit 0
        fi
done
