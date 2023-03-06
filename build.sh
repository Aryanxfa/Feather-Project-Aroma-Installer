#!/usr/bin/env bash

# Build script for Feather Project
# To be used when ones images are ready
# Call with the format ./build.sh FeatherProject_S22_T_v0.7.zip

if [ -z "$1" ]
then
    echo "Filename not provided"
    exit
fi

if [ ! -f META-INF/scripts/xbin/ ]
then
    echo "Failed with error 1"
    exit
fi

zip -v -r $1 META-INF mods kernel img aux featherproject.keys
