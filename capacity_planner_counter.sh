#!/bin/bash
#Get the counts for hosts, services, and check intervals for Capacity Planner

#count of hosts
CHOSTS="$(mon query ls hosts -c name | wc -l)"

#count of services
CSERVICES="$(mon query ls services -c description | wc -l)"

#present the unique count of various check intervals for services
#results are line separated as count,interval
UINTERVALS="$(mon query ls services -c check_interval | grep -o '^[0-9]*\.[0-9]' | sort | uniq -c | awk '{ print $1 "," $2}')"

echo $1 - HOSTS:$CHOSTS, SERVICES:$CSERVICES, UNIQUE INTERVALS:$UINTERVALS
