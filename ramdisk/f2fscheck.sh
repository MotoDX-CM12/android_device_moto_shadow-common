#!/sbin/bbx sh
#
# Check if this is a F2FS data partition and copy in the right fstab
#
BB_STATIC="/sbin/bbx"

FSTYPE=`$BB_STATIC blkid /dev/block/mmcblk1p24 | $BB_STATIC cut -d ' ' -f3 | $BB_STATIC cut -d '"' -f2`
if [ "$FSTYPE" == "ext4" ] || [ "$FSTYPE" == "ext3" ]
then
  $BB_STATIC mv -f /fstab.mapphone_cdma_ext4 /fstab.mapphone_
  $BB_STATIC rm /fstab.mapphone_cdma_f2fs
else
  $BB_STATIC mv -f /fstab.mapphone_cdma_f2fs /fstab.mapphone_
  $BB_STATIC rm /fstab.mapphone_cdma_ext4
fi

