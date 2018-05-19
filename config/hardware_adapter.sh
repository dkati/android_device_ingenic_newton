#!/system/bin/sh
#
# adapter hardware configuration from /proc/hardware/list
# bluetooth configuration
# bluetooth.port:ttyS1
# bluetooth.chip:bcm43438
hardware_list=/proc/hardware/list
bt_firmwware_patch=/system/etc/firmware

bt_vendor_patch=`busybox find /system -name "bt_vendor.conf"`
src_port=`busybox cat $bt_vendor_patch | busybox grep "UartPort" |  busybox awk -F '/' '{print $NF}' `

dst_port=`busybox cat $hardware_list | busybox grep "bluetooth" | busybox grep "port" | busybox awk -F ':' '{print $NF}' `
dst_chip=`busybox cat $hardware_list | busybox grep "bluetooth" | busybox grep "chip" | busybox awk -F ':' '{print $NF}' `
dst_file_path=`busybox cat $bt_vendor_patch | busybox grep "FwPatchFilePath" |  busybox awk -F '=' '{print $NF}' `
dst_file_path=${dst_file_path%/*}
busybox mount -o remount,rw  /dev/block/platform/jzmmc_v1.2.0/by-name/system /system
if [ "$dst_port" != "" ]; then
	busybox sed -i "s/$src_port/$dst_port/g" $bt_vendor_patch
fi

if [ "$dst_chip" != "" ]; then
	busybox rm $dst_file_path
	ln -s $bt_firmwware_patch/$dst_chip ${dst_file_path}
fi
busybox mount -o remount,ro  /dev/block/platform/jzmmc_v1.2.0/by-name/system /system

