#!/system/bin/sh

mount -o remount,rw /system

if [ ! -d /system/hw_info ]; then
mkdir /system/hw_info
fi

rm -rf /system/hw_info/serial_numbers
touch /system/hw_info/serial_numbers
# See partition distribution from
# <bootable/bootloader/uboot/board/ingenic/watch/partitions.tab>
dd  if=/dev/block/platform/jzmmc_v1.2.0/by-name/misc  of=/system/hw_info/serial_numbers bs=128 count=1

mount -o remount,ro /system

