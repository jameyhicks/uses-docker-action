#!/bin/sh -l

ls /github/workspace

cd /github/workspace/${BUILD_DIRECTORY}

make ${BUILD_TARGET}
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
