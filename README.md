# Linux Usability fixes

## Openbox

### Changing keybinds

Change `.config/openbox/lxqt-rc.xml`

Run `openbox --reconfigure` to apply settings.

OR 

Download and install Obkey.

### Screen tearing

Autostart compton (install it first) with the flags --backend glx --paint-on-overlay --vsync opengl-swc

OR (does not seem to work)

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

For me it seems like there is one service holding the others up. Disabling all these only took about 5 seconds off the boot time

Disable these services (I am not responsible for you FUBARing your system):

+ dkms.servce
+ ModemManager.service
+ akms.service
+ NetworkManager-wait-online.service
+ lvm2-monitor.service
+ fedora-readonly.service
+ livesys-late.service
+ livesys.service
+ all plymouth services (about 2 secounds off)
+ avahi-daemon.service (took off about 3 secounds)

Maybe disable these (I am less sure these are unecessary)) 

+ firewalld.service (probably not this one)
+ rtkit-daemon.service (does not slow down that much)
+ systemd-journal-flush.service 

Use `systemctl disable service-name.service`

### Boot analysis

Display time to load each service `systemd-analyze blame`

Show last boot times and stats `systemd-analyze`

Plot service load times `systemd-analyze plot > boot.svg`
