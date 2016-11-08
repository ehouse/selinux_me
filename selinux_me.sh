#!/bin/bash

DRYRUN=1

if [[ -z $(sestatus | grep "SELinux status" | grep "enabled") ]]; then
    echo "Selinux must be enabled to continue"
    exit 1
fi

if [[ -z $(sestatus | grep "Current mode" | grep "permissive") ]]; then
    echo "WARNING selinux is in permissive mode. Changes will not be noticed"
fi

echo "Generating WORKING_POLICY"
audit2allow -a -M WORKING_POLICY
