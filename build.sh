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
mkdir device/*/overlay/
cp ../FP_overlay/a10/framework-res__auto_generated_rro_vendor.apk device/a10/overlay/
cp ../FP_overlay/a20/framework-res__auto_generated_rro_vendor.apk device/a20/overlay/
cp ../FP_overlay/a20e/framework-res__auto_generated_rro_vendor.apk device/a20e/overlay/
cp ../FP_overlay/a30/framework-res__auto_generated_rro_vendor.apk device/a30/overlay/
cp ../FP_overlay/a30s/framework-res__auto_generated_rro_vendor.apk device/a30s/overlay/
cp ../FP_overlay/a40/framework-res__auto_generated_rro_vendor.apk device/a40/overlay/

xmlstarlet val device/*/camera-feature.xml

rm -f $1
zip -v -r $1 META-INF/com META-INF/scripts/bin mods kernel img device auxy csc debloat featherproject.keys META-INF/scripts/xbin
