# capacity_planner_checker
Short script to get the host, service and interval count of an OP5 Monitor master or poller.

The output is formatted as such: 
* HOSTNAME - HOSTS:#, SERVICES:##, UNIQUE INTERVALS:#,#.#

Here's an example showing a monitor server with some hosts, services and three different intervals:
* op5.test.com - HOSTS:1, SERVICES:42, UNIQUE INTERVALS:1,1.0 40,5.0 1,7.0

## Configure this as a service check

1. clone this repo to /opt/plugin/custom
2. set ownership: `chown monitor:apache capacity_planner_counter.sh`
3. set execute bit: `chmod +x capacity_planner_counter.sh`
4. check_command: `$USER1$/custom/capacity_planner_counter/capacity_planner_counter.sh $HOSTNAME$`
