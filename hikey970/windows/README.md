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
1. Install python 2.7.
2. Pip install pyserial.
3. Manual add USB-Serial com ports driver.
4. Change recovery.bat com port name (COM4).
