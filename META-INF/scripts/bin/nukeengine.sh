#! /tmp/busybox sh

cat /tmp/dblist | while read line; do
    /tmp/busybox rm "/system_root/system/$line"
done
