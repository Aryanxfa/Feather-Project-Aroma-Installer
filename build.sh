#!/usr/bin/env bash

# Build script for Feather Project
# To be used when ones images are ready
# Call with the format ./build.sh FeatherProject_S22_T_v0.7.zip

zip -v -r $1 META-INF system data boot.img dtb.img dtbo.img featherproject.keys LICENSE
