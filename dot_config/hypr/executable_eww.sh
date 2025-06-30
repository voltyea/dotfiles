#!/bin/bash

while ! swww query &>/dev/null; do
  sleep 0.5
done

eww open clock
