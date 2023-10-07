#!/usr/bin/env bash

# Build script for Feather Project
# To be used when ones images are ready
# Call with the format ./build.sh FeatherProject_S22_T_v0.7.zip

supported_devices=("a10" "a20" "a20e")

if [ -z "$1" ]; then
    echo "Filename not provided"
    exit
fi

# Validate XML
./validatexml.sh
if [[ $? -ne 0 ]]; then
    echo "XML validation failed. Exiting..."
    exit 1
fi

# Pull overlays
for device in "${supported_devices[@]}"; do
    mkdir -p device/${device}/overlay/
    cp ../FP_overlay/${device}/framework-res__auto_generated_rro_vendor.apk device/${device}/overlay/
    cp ../FP_kernels/${device}/* device/${device}/
done

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
