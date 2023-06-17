#!/sbin/sh

configfile=/tmp/aroma/compatible.prop

append_to_file() {
    local content="$1"
    echo "$content" >>"$configfile"
}
rm -f $configfile
touch $configfile

system_size=$(blockdev --getsize64 /dev/block/by-name/system)
vendor_size=$(blockdev --getsize64 /dev/block/by-name/vendor)
product_size=$(blockdev --getsize64 /dev/block/by-name/product)

system_size_mb=$(echo "scale=2; $system_size / (1024 * 1024 * 1024)" | bc)
vendor_size_mb=$(($vendor_size / 1024 / 1024))
product_size_mb=$(($product_size / 1024 / 1024))

append_to_file "system_size=$system_size"
append_to_file "vendor_size=$vendor_size"
append_to_file "product_size=$product_size"

echo "<b>COMPUTING SPACE REQUIREMENTS :-</b>"
echo "    -> System : $system_size_mb GB"
echo "    -> Vendor : $vendor_size_mb MB"
echo "    -> Product : $product_size_mb MB"

if [ "$system_size" -ge 4320133120 ]; then
    append_to_file "system_compatible=1"
else
    append_to_file "system_compatible=0"
    echo "    -> <#ff0000>System is Insufficient</#>"
    exit 55
fi
if [ "$vendor_size" -ge 545259520 ]; then
    append_to_file "vendor_compatible=1"
else
    append_to_file "vendor_compatible=0"
    echo "    -> <#ff0000>Vendor is Insufficient</#>"
    exit 55
fi
if [ "$product_size" -ge 209715200 ]; then
    append_to_file "product_compatible=1"
else
    append_to_file "product_compatible=0"
    echo "    -> <#ff0000>Product is Insufficient</#>"
    exit 55
fi

#400mb size 419430400
if [ "$product_size" -ge 419430300 ]; then
    append_to_file "auxy_to_product=1"
else
    append_to_file "auxy_to_product=0"
fi

exit 1
