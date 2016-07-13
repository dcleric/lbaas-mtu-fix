Simple fix for the MTU problem in LBaaS v1 in Neutron Openstack.
Description of the problem:
 1. Openstack Neutron LBaaS v1 enabled.
 2. Any tenant-networking technology with lower than normal MTU is used (ex. 1450 for the VXLAN).
 3. When Neutron is creating network namespace for HAProxy configuration in you LB, it ignores lower MTU and set it to the 1500, hence when you're trying to communicate with VM in tenants you will have a broken packets.

Fix:
 1. Install script on a networking nodes (you're using HA, right?) ex. /usr/local/bin.
 2. Setup a cron job with 1-5 min interval and you're done.
