#!/bin/bash

export AWS_SHARED_CREDENTIALS_FILE=config/profile
export AWS_PROFILE=$(head -n 1 config/profile) | cut -d "[" -f2 | cut -d "]" -f1

# BUILD PROFILE OF INSTANCES DEPLOYED IN SYSTEM
#aws ec2 describe-instances --query 'Reservations[].Instances[].[]' --filter "Name=instance-state-name,Values=stopped" "Name=tag:Name,Values=rotation*" --output text
aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId, InstanceState, PublicIpAddress, Tags]' --filter "Name=instance-state-name,Values=stopped" "Name=tag:Name,Values=rotation*" --output text
