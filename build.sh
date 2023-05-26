#!/usr/bin/env bash

# Build script for Feather Project
# To be used when ones images are ready
# Call with the format ./build.sh FeatherProject_S22_T_v0.7.zip

if [ -z "$1" ]; then
    echo "Filename not provided"
    exit
fi

if [ ! -f META-INF/scripts/xbin/sleep.kek.br ]; then
    echo "Failed with error 1"
    exit
fi

#Pull overlays
mkdir device/a10/overlay/
cp ../FP_overlay/a10/framework-res__auto_generated_rro_vendor.apk device/a10/overlay/

mkdir device/a20/overlay/
cp ../FP_overlay/a20/framework-res__auto_generated_rro_vendor.apk device/a20/overlay/

mkdir device/a20e/overlay/
cp ../FP_overlay/a20e/framework-res__auto_generated_rro_vendor.apk device/a20e/overlay/

mkdir device/a30/overlay/
cp ../FP_overlay/a30/framework-res__auto_generated_rro_vendor.apk device/a30/overlay/

mkdir device/a30s/overlay/
cp ../FP_overlay/a30s/framework-res__auto_generated_rro_vendor.apk device/a30s/overlay/

mkdir device/a40/overlay/
cp ../FP_overlay/a40/framework-res__auto_generated_rro_vendor.apk device/a40/overlay/

zip -v -r $1 META-INF mods kernel img device auxy csc debloat featherproject.keys
