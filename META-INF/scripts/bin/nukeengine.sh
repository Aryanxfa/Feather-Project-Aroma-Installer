#! /tmp/busybox sh

cat /tmp/dblist | while read line; do
    # do something with $line here
    /tmp/busybox rm "/system_root/system/$line"
done
