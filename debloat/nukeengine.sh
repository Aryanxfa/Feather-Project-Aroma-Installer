#! /tmp/busybox sh

cat /tmp/dblist | while read line 
do
   # do something with $line here
   rm -rf "/system_root/system/$line"
done
