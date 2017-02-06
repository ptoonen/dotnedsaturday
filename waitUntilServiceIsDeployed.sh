#!/bin/bash

app_name=$1
num_desired_instances=$2

expected_deployment_status="$num_desired_instances/$num_desired_instances"
current_deployment_status=$(docker service ls --filter name=$app_name | awk 'NR==2{ print $4 }')

while [ $current_deployment_status != $expected_deployment_status ]
do 
    sleep 5
    echo "Still waiting for service to fully deploy, current deployment status: $current_deployment_status"
    current_deployment_status=$(docker service ls --filter name=$app_name | awk 'NR==2{ print $4 }')
done

echo "All done, continuing the release."