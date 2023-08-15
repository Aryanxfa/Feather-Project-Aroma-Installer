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
# Validate XML
./validatexml.sh
if [[ $? -ne 0 ]]; then
    echo "XML validation failed. Exiting..."
    exit 1
fi

# Pull overlays
mkdir device/*/overlay/ 2>/dev/null
cp ../FP_overlay/a10/framework-res__auto_generated_rro_vendor.apk device/a10/overlay/
cp ../FP_overlay/a20/framework-res__auto_generated_rro_vendor.apk device/a20/overlay/
cp ../FP_overlay/a20e/framework-res__auto_generated_rro_vendor.apk device/a20e/overlay/
cp ../FP_overlay/a30/framework-res__auto_generated_rro_vendor.apk device/a30/overlay/
cp ../FP_overlay/a30s/framework-res__auto_generated_rro_vendor.apk device/a30s/overlay/
cp ../FP_overlay/a40/framework-res__auto_generated_rro_vendor.apk device/a40/overlay/

cp ../FP_kernels/a10/* device/a10/
cp ../FP_kernels/a20/* device/a20/
cp ../FP_kernels/a20e/* device/a20e/
cp ../FP_kernels/a30/* device/a30/
cp ../FP_kernels/a30s/* device/a30s/
cp ../FP_kernels/a40/* device/a40/

rm -f $1
lowercase_arg="${1,,}"
if [[ "$lowercase_arg" == *"patch"* ]]; then
    rm device/*/boot.img
    rm mods/magisk.zip
    zip -v -r $1 META-INF/com META-INF/scripts/bin mods img device csc debloat featherproject.keys auxy/data/app/.set #META-INF/scripts/xbin/mounts.kek.br
    adb push $lowercase_arg /sdcard/
    adb shell twrp install /sdcard/$lowercase_arg
else
    zip -v -r $1 META-INF/com META-INF/scripts/bin mods img device auxy csc debloat featherproject.keys META-INF/scripts/xbin
fi
