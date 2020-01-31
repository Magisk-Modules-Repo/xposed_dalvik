# Systemless Xposed Framework

### This module is only for Android 5.0 to Android 8.1!

Please install

- topjohnwu modified [XposedInstaller(3.1.5)](https://forum.xda-developers.com/attachment.php?attachmentid=4751403&d=1556682769)
- dvdandroid materialised [XposedInstaller(3.1.5)](https://github.com/DVDAndroid/XposedInstaller/)

to properly detect Systemless Xposed.

The APK is signed by personal key, you might need to uninstall other versions before installing them.

The binaries are identical to builds downloaded from official links [https://dl-xda.xposed.info/framework/](https://dl-xda.xposed.info/framework/), with the exception that `app_process*` is patched with the following command:

`sed -i 's:/system/xposed.prop\x0:/sbin/xposed.prop\x0\x0\x0:g' app_process*`

This module most likely will never get any updates in the future, since @rovo89 seems to have stopped development. This module is here for historical reasons.

For higher Android version, you only can use EdXposed.

check the Wiki: [https://github.com/ElderDrivers/EdXposed/wiki/Available-Android-versions](https://github.com/ElderDrivers/EdXposed/wiki/Available-Android-versions)
