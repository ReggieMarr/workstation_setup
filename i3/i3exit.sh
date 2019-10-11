#!/bin/bash

for pid in $(pgrep -f 'I3_KILL_ON_EXIT'); do
    pgid=$(ps -o pgid= $pid | grep -o '[0-9]*')
    kill -- "-$pgid"
done

i3-msg exit

