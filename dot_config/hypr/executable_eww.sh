#!/bin/bash

eww daemon

while ! swww query &>/dev/null; do
  sleep 0.5
done

sleep 0.5

eww open clock
