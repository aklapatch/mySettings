# Solutions to Linux Problems

## Openbox

### Changing keybinds

Change `.config/openbox/lxqt-rc.xml`

Run `openbox --reconfigure` to apply settings.

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
