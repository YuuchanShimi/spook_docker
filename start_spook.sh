#!/bin/bash

# Launch the SLAM and navigation stack
gnome-terminal -- bash -c "ros2 launch spook_navstack autonomous_launch.py; exec bash"
gnome-terminal -- bash -c "ros2 launch spook_simulation bringup_launch.py; exec bash"
gnome-terminal -- bash -c "ros2 launch nav2_bringup bringup_launch.py use_sim_time:=False autostart:=True map:=/home/astro/workspaces/spook_ws/src/spook_simulation/maps/2LDK_new.yaml params_file:=/home/astro/workspaces/spook_ws/src/spook_navstack/params/bbboy_nav2_params.yaml; exec bash"