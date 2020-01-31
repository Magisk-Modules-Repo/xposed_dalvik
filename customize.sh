SKIPUNZIP=1

VERSION=$(grep_prop version "$TMPDIR/module.prop")

ui_print "- Xposed Version ${VERSION}"

if [[ ${API} -ge 21 ]]; then
    ui_print "******************************"
    ui_print "! Dalvik Xposed works only in versions prior to Android Lollipop"
    ui_print "! For Android Lollipop and above"
    ui_print "! You can download from 'Xposed Installer' or 'Magisk Manager(Systemless-ly)'"
    ui_print "! Learn more: https://github.com/ElderDrivers/EdXposed/wiki/Available-Android-versions"
    abort    "******************************"
fi

if [[ "${ARCH}" != "arm" && "${ARCH}" != "arm64" && "${ARCH}" != "x86" && "${ARCH}" != "x64" ]]; then
	abort "! Unsupported platform ${ARCH}"
else
	ui_print "- Device platform: ${ARCH}"
fi

[[ -f "/data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar" || -f "/data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar.newversion"  ]] || abort "! XposedBridge not found, have installed Xposed in Xposed Installer?"

ui_print "- XposedBridge found"

ui_print "- Extracting module files"

unzip -o "${ZIPFILE}" module.prop 'system/*' -d "${MODPATH}" >&2

if [[ "${ARCH}" == "arm" || "${ARCH}" == "arm64" ]]; then
    ui_print "- Extracting libraries for arm"
    unzip -o "${ZIPFILE}" 'arm/*' -d "${MODPATH}" >&2
    mv "${MODPATH}/arm/system" "${MODPATH}/system"
    rm -rf "${MODPATH}/arm"
else
    ui_print "- Extracting libraries for x86"
    unzip -o "${ZIPFILE}" 'x86/*' -d "${MODPATH}" >&2
    mv "${MODPATH}/x86/system" "${MODPATH}/system"
    rm -rf "${MODPATH}/x86"
fi

set_perm_recursive "${MODPATH}" 0 2000 0755 0644

ui_print "- Welcome to Xposed ${VERSION}!"
