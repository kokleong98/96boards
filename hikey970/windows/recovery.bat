@echo off
pause
echo "Flashing ptable "
python hisi-idt.py -d COM4 --img1 ..\images\bootloader\sec_usb_xloader.img --img2 ..\images\bootloader\sec_usb_xloader2.img --img3 ..\images\bootloader\l-loader.bin
TIMEOUT /T 1

echo "Flashing ptable "
fastboot flash ptable ..\images\fastboot\prm_ptable.img
TIMEOUT /T 1

echo "Flashing Boot Loader.. "
fastboot flash xloader ..\images\fastboot\sec_xloader.img
TIMEOUT /T 1
fastboot flash fastboot ..\images\fastboot\l-loader.bin
TIMEOUT /T 1
fastboot flash fip ..\images\fastboot\fip.bin
TIMEOUT /T 1

echo "Flashing boot image.. "
fastboot flash boot ..\images\boot\boot-hikey970.uefi.img
TIMEOUT /T 1

echo "Flashing rootfs image.. "
fastboot flash userdata ..\images\os\hikey970-lebian9-tf.img
pause