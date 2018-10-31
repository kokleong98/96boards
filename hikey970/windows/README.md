Dependencies
- MediaTek USB VCOM Driver (Under github "drivers" sub-folder)
- Hikey 970 windows driver (Acquired through windows update - ADB mode)
- ADB tools (Included fastboot.exe in Git)
- python 2.7
- pyserial

Additional image dependencies
- boot image (eg. boot-hikey970.uefi.img)
- os image (eg. hikey970-lebian9-tf.img)

Lemaker image links
- http://mirror.lemaker.org/Hikey%20970%20Lebian.rar
- http://mirror.lemaker.org/hikey970-lebian-9.tar.gz

Flashing Guide
1. Download python 2.7.
2. Install python 2.7 and pip install pyserial.
   - 2.1. Run python installer package and make sure add python to environment option is installed.
   - 2.2. Run command "cmd" using Administrator privileges and pip install pyserial.
3. Download boot and userdata image.
4. Download repository https://github.com/kokleong98/96boards/ and extract to local repository.
5. Extract boot and userdata image and copy to repository windows folder.
6. Unzip drivers 7z package in local repository folder.
7. Prepare for Flashing.
   - 7.1. Make sure HiKey 970 is power-off and turn switch 1, 2 and 3 on.
   - 7.2. Connect HiKey 970 to your Windows through USB cable.
   - 7.3. Power on HiKey 970 and wait Windows detect the unknown device "USB SER".
   - 7.4. Manual install driver for "USB SER" using the provided repository drivers and check the given COM port number. 
   - 7.5. Run command "cmd" using Administrator privileges.
   - 7.6. Change directory to local repository which consist the "Recovery.bat" file.
   - 7.7. Run Recovery.bat \<Your COM port\> boot=\<boot image\> userdata=\<OS image\> <br />
          eg. Recovery.bat COM4 boot=boot-hikey970.uefi.img userdata=hikey970-lebian9-tf.img
   - 7.8. You will see an unknown device "HiKey970" in mid of flashing process in step 7.7, choose to detect and update driver from Microsoft Online Updates repository.
   - 7.9. Flashing will automatically resumed after step 7.8 is completed.
   - 7.10. Wait until flashing completed and power-off HiKey 970 and set switch 2 and 3 off.
