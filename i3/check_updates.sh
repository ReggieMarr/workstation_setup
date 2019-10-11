#!/bin/bash

timeout 12 aptdcon --refresh --allow-unauthenticated > /dev/null 2>&1
retVal=$?
if [ $retVal -ne 0 ]; then
    echo ""
    exit 0
fi

apt_output=$(apt list --upgradable 2>/dev/null | wc -l)
num_updates=$((apt_output-1))
if (( num_updates == 0 )); then
    echo ""
else
    echo "$num_updates "
fi

