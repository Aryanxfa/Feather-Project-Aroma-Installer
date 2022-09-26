#!/sbin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Originally Coded by corsicanu@XDAdevelopers
# Special thanks goes to prototype74, ALEXNDR, Tkkg1994,
# lam1990, Repulsa, ambasadii and maybe others

umount /system

e2fsck -f /dev/block/by-name/system
resize2fs /dev/block/by-name/system
e2fsck -f /dev/block/by-name/vendor
resize2fs /dev/block/by-name/vendor
e2fsck -f /dev/block/by-name/product
resize2fs /dev/block/by-name/product
sync
e2fsck -f /dev/block/by-name/system
resize2fs /dev/block/by-name/system
e2fsck -f /dev/block/by-name/vendor
resize2fs /dev/block/by-name/vendor
e2fsck -f /dev/block/by-name/product
resize2fs /dev/block/by-name/product
sync