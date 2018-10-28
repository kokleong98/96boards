@echo off

REM INIT VARIABLES
SET BOOT_IMAGE=
SET USER_IMAGE=

REM 1st parameter.
IF "%2"=="" (
  GOTO missinginput
)
IF "%3"=="" (
  GOTO missinginput
)
IF NOT EXIST "%3" (
  echo missing file: %3
  GOTO missing_img
)
IF "%1"=="boot" (
  SET BOOT_IMAGE=%3
)

IF "%1"=="userdata" (
  SET USER_IMAGE=%3
)

REM 2nd parameter.
IF "%4"=="" (
  GOTO checkinput
)
IF "%5"=="" (
  GOTO checkinput
)
IF NOT EXIST "%5" (
  echo missing file: %5
  GOTO missing_img
)

IF "%4"=="boot" (
  SET BOOT_IMAGE=%5
)

IF "%4"=="userdata" (
  SET USER_IMAGE=%5
)

:checkinput
IF "%BOOT_IMAGE%"=="" (
  IF "%USER_IMAGE%"=="" (
    GOTO missinginput
  )
)

pause
echo "Flashing ptable "
python hisi-idt.py -d %1 --img1 ..\images\bootloader\sec_usb_xloader.img --img2 ..\images\bootloader\sec_usb_xloader2.img --img3 ..\images\bootloader\l-loader.bin
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

:main

IF NOT "%BOOT_IMAGE%"=="" (
  echo "Flashing boot image.. "
  fastboot flash boot "%BOOT_IMAGE%"
  TIMEOUT /T 1
)

IF NOT "%USER_IMAGE%"=="" (
  echo "Flashing rootfs image.. "
  fastboot flash userdata "%USER_IMAGE%"
)

GOTO end

:missing_img
:missinginput
echo Missing or invalid input parameters.
echo Syntax sample: recovery.bat COM3 boot=boot.img userdata=os.img

:end
SET BOOT_IMAGE=
SET USER_IMAGE=

pause
