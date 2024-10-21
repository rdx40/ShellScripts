#!/bin/bash

read -p "Enter the name of the process you want to kill: " process_name

pid=$(pgrep -f "$process_name")

if [ -z "$pid" ]; then
    echo "Process $process_name not found."
    exit 1
fi

read -p "Process $process_name with PID $pid found. Do you want to kill it? (y/n): " confirm

if [ "$confirm" = "y" ]; then
    kill -15 $pid
    echo "Process $process_name (PID $pid) killed."
else
    echo "Process $process_name not killed."
fi

