#!/usr/bin/env bash

if [ -z "$(pgrep -x polybar)" ]; then
	BAR="baruchela"
	for m in $(polybar --list-monitors | cut -d":" -f1 | tac); do
		MONITOR=$m polybar --reload $BAR &
		sleep 0.5 
	done
else
	polybar-msg cmd restart
fi

echo "All Polybar instances launched..."
