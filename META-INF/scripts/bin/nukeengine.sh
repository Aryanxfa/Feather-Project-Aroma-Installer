#! /tmp/busybox sh

cat /tmp/dblist | while read line; do
    if [ -n "$line" ]; then
        /tmp/busybox rm -rf "/system_root/system/$line"
    fi
done
