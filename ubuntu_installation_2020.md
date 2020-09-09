# Ubuntu Installation [Dual Boot with Windows]

This article is intended to help installing Ubuntu 20.04 alongside Windows 10 in a 2020 model laptop [HP or Lenovo or ASUS]

## Latest laptops

Latest laptops ship with the following features

* Fast boot
* Secure boot
* Intel Rapid Storage Technology [RAID caching for HDs]
* UEFI [Instead of BIOS]

You may have to disable some or all of the above features to get ubuntu working on your laptop

## Option1: Wubi

Wubi works with the following

* Secure boot [Encryption certificate keys have been included in [latest version](https://github.com/hakuna-m/wubiuefi/wiki)]
* UEFI

You may have to disable

* Fast boot [and]
* Intel Rapid Storage Technology

### Wubi ISO not found

* I was getting an error **"Installation ISO file not found"** with Wubi for installing Ubuntu 20.04 alongside Windows 10 in UEFI.
* [Github Issue](https://github.com/hakuna-m/wubiuefi/issues/100)
* At the time of this writing [9-Sep-2020], this issue is still Open. So I could not install Ubuntu as an application inside Windows 10 using Wubi
* Hence, I switched to installing Ubuntu 20.04 alongside Windows 10 in a dual boot setup

## Option2: Dual Boot 

### Disable Fast boot

* Disabling Fast boot is quite easy.
* Press **F2** upon boot to enter UEFI menu
* Go to Boot tab and disable Fast boot

### Disable Intel Rapid Storage Technology [RST]

* Attempt to disable it using instructions from [Ubuntu's website](https://discourse.ubuntu.com/t/ubuntu-installation-on-computers-with-intel-r-rst-enabled/15347)
* If the above doesnt work for you [It didnt work for me as well], you could try [this](https://askubuntu.com/questions/1233623/workaround-to-install-ubuntu-20-04-with-intel-rst-systems)
* Implement Choice #2 of first answer there

#### Instructions: Disable iRST for Windows 10

* Right-click the Windows Start Menu. Choose Command Prompt (Admin).
* If you don’t see Command Prompt listed, it’s because you have already been updated to a later version of Windows.
* If so, use this method instead to get to the Command Prompt:  -  Click the Start Button and type cmd  - Right-click the result and select Run as administrator
* Type this command and press ENTER: bcdedit /set {current} safeboot minimal  - If this command does not work for you, try bcdedit /set safeboot minimal
* Restart the computer and enter BIOS Setup (the key to press varies between systems).
* Change the SATA Operation mode to AHCI from either IDE or RAID (again, the language varies).
* Save changes and exit Setup and Windows will automatically boot to Safe Mode.
* Right-click the Windows Start Menu once more. Choose Command Prompt (Admin)
* Type this command and press ENTER: bcdedit /deletevalue {current} safeboot
* If you had to try the alternate command above, you will likely need to do so here also: bcdedit /deletevalue safeboot
* Reboot once more and Windows will automatically start with AHCI drivers enabled.

Now Windows 10 would work comfortably with AHCI setting for your HD

### Install Ubuntu alongside Windows 10

[Step by step instructions](https://www.youtube.com/watch?v=-iSAyiicyQY)

