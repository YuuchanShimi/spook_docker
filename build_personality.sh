#!/bin/bash
# Quick build script for spook_personality on Jetson Orin

set -e

WORKSPACE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_TYPE=${1:-Release}

cd "$WORKSPACE_PATH"
source /opt/ros/jazzy/setup.bash 2>/dev/null || source /opt/ros/humble/setup.bash
mkdir -p build install
colcon build \
    --packages-select spook_personality \
    --cmake-args \
        -DCMAKE_CXX_FLAGS="-O3 -march=native" \
        -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    --symlink-install

echo "Build complete!"
