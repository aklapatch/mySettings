# Linux Usability fixes

## Openbox

### Changing keybinds

Change `.config/openbox/lxqt-rc.xml`

Run `openbox --reconfigure` to apply settings.

OR 

Download and install Obkey.

### Screen tearing

Autostart compton (install it first) with the flags --backend glx --paint-on-overlay --vsync opengl-swc

OR (Intel graphics only)

Link here (https://www.pcsuggest.com/fix-linux-screen-tearing/)

Create this file `/etc/X11/xorg.conf.d/20-intel.conf`

Save the following in that file.

```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
    Option  "TripleBuffer" "true"
    Option  "AccelMethod" "uxa"
EndSection
```
Login and reboot.

## Miscellaneous

### Touchpad tap to Click

Make a file: /etc/X11/xorg.conf.d/30-touchpad.conf

Paste this in it:
```
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
```

# Linux optimizations

### Faster boot time

Disable dkms.servce ModemManager.service and akms.service

Use `systemctl disable service-name.service`

### Boot analysis

Display time to load each service `systemd-analyze blame`

Show last boot times and stats `systemd-analyze`
