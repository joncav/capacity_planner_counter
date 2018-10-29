#!/bin/bash
# Get the counts for hosts, services, and check intervals for Capacity Planner

# Count of hosts
CHOSTS="$(mon query ls hosts -c name | wc -l)"

# Count of services
CSERVICES="$(mon query ls services -c description | wc -l)"

# Present the unique count of various check intervals for services
# Results are line separated as count,interval
UINTERVALS="$(mon query ls services -c check_interval | grep -o '^[0-9]*\.[0-9]' | sort | uniq -c | awk '{ print $1 "," $2}')"
# Calculate average check interval
AVGINTERVALS="$(mon query ls services -c check_interval | wc -c) / $CSERVICES)"

echo $1 - HOSTS:$CHOSTS, SERVICES:$CSERVICES, UNIQUE INTERVALS:$UINTERVALS | hosts=$CHOSTS services=$CSERVICES avg_intervals=$AVGINTERVALS
