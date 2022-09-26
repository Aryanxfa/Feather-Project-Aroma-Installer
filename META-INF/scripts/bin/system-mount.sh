#!/sbin/sh

rm -rf /tmp/mount.cfg

block_test1=$(echo /dev/block/*/by-name | grep -v "\*")
block_test2=$(echo /dev/block/*/*/by-name | grep -v "\*")
block_test3=$(echo /dev/block/*/*/*/by-name | grep -v "\*")

if [ "$block_test1" ]; then
	xblock=$block_test1
elif [ "$block_test2" ]; then
	xblock=$block_test2
elif [ "$block_test3" ]; then
	xblock=$block_test3
else
	exit
fi

SLOT=""
for line in $(cat /proc/cmdline); do
	if [ "$(echo $line | grep androidboot.slot_suffix)" ]; then
		SLOT=$(echo $line | cut -d"=" -f2)
	elif [ "$(echo $line | grep androidboot.slot)" ]; then
		SLOT=_$(echo $line | cut -d"=" -f2)
	fi
done

for item in SYSTEM system APP app system_a system_b; do
	full_block="$xblock/$item"
	test_item=$(readlink $full_block)
	if [ "$test_item" ]; then
		basenamex=$(basename $full_block | cut -d"_" -f1)
		dirnamex=$(dirname $full_block)
		if [ ! "$(basename $full_block | grep "_")" ]; then SLOT=""; fi
		full_blockx="$dirnamex/$basenamex"
		echo "system_block=$full_blockx$SLOT" >> /tmp/mount.cfg
		break
	fi
done

if [ -d /system_root ]; then
	echo "sys=/system_root" >> /tmp/mount.cfg
else
	echo "sys=/system" >> /tmp/mount.cfg
fi

for item in VENDOR vendor VNR vendor_a vendor_b; do
	full_block="$xblock/$item"
	test_item=$(readlink $full_block)
	if [ "$test_item" ]; then
		basenamex=$(basename $full_block | cut -d"_" -f1)
		dirnamex=$(dirname $full_block)
		if [ ! "$(basename $full_block | grep "_")" ]; then SLOT=""; fi
		full_blockx="$dirnamex/$basenamex"
		echo "vendor_block=$full_blockx$SLOT" >> /tmp/mount.cfg
		break
	fi
done

for item in PRODUCT product PRD product_a product_b; do
	full_block="$xblock/$item"
	test_item=$(readlink $full_block)
	if [ "$test_item" ]; then
		basenamex=$(basename $full_block | cut -d"_" -f1)
		dirnamex=$(dirname $full_block)
		if [ ! "$(basename $full_block | grep "_")" ]; then SLOT=""; fi
		full_blockx="$dirnamex/$basenamex"
		echo "product_block=$full_blockx$SLOT" >> /tmp/mount.cfg
		break
	fi
done

for item in ODM odm odm_a odm_b; do
	full_block="$xblock/$item"
	test_item=$(readlink $full_block)
	if [ "$test_item" ]; then
		basenamex=$(basename $full_block | cut -d"_" -f1)
		dirnamex=$(dirname $full_block)
		if [ ! "$(basename $full_block | grep "_")" ]; then SLOT=""; fi
		full_blockx="$dirnamex/$basenamex"
		echo "odm_block=$full_blockx$SLOT" >> /tmp/mount.cfg
		break
	fi
done

for item in boot boot_a boot_b BOOT Boot kernel kernel_a kernel_b KERNEL Kernel LNX ramdisk ramdisk_a ramdisk_b RAMDISK Ramdisk; do
	full_block="$xblock/$item"
	test_item=$(readlink $full_block)
	if [ "$test_item" ]; then
		basenamex=$(basename $full_block | cut -d"_" -f1)
		dirnamex=$(dirname $full_block)
		if [ ! "$(basename $full_block | grep "_")" ]; then SLOT=""; fi
		full_blockx="$dirnamex/$basenamex"
		echo "boot_block=$full_blockx$SLOT" >> /tmp/mount.cfg
		break
	fi
done