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

Disable plymouth boot screen `sudo dnf remove plymouth`

Remove dracut as well `sudo dnf remove dracut` (removes abrtd)

Please note that not all these options were tested. Using systemctl to disable things does not mean they will not come up the next boot.

Disable these services (I am not responsible for you FUBARing your system):

+ dkms.servce
+ ModemManager.service
+ akms.service
+ NetworkManager-wait-online.service
+ lvm2-monitor.service
+ fedora-readonly.service
+ livesys-late.service
+ livesys.service
+ avahi-daemon.service (took off about 3 secounds)
+ abrtd.service (removed with dracut)
+ systemd-udev-settle.service (i will mask and see what happens)
+ auditd.service
+ rsyslog.service
+ rtkit-daemon.service
+ chronyd.service

MAYBE disable these (I am less sure these are unecessary)

+ firewalld.service (if you do not need dynamic firewall))
+ rtkit-daemon.service (does not slow down that much)
+ systemd-journal-flush.service
+ fedora-import-state.service
+ gssproxy.service
+ udisks2.service (does not break system)

Had to mask these 

+ the systemd-fsck service
+ chronyd.service
+ systemd-udev-settle.service
+ systemd-tmpfiles-setup.service
+ systemd-update-utmp.service
+ gssproxy.service
+ nfs-config.service (network filesystem, took a second off boot)
+ sys-kernel-debug.mount
+ dnfdaemon.service

#### Disabling Services

Use `systemctl disable service-name.service`

Masking (stronger disable) `sudo systemctl mask service-name.service`

Unmasking: `sudo systemctl unmask service-name.service`

OR

reinstall service/package or delete symlink `/lib/systemd/system/service-name.service`
Then run sudo systemctl `daemon-reload`
To check is symlink goes to /dev/null sudo file `/lib/systemd/system/service-name.service`

Consider removing `/var/log/journal` or renaming it.

### Boot analysis

Display time to load each service `systemd-analyze blame`

Show last boot times and stats `systemd-analyze`

Plot service load times `systemd-analyze plot > boot.svg`

Show dependencies and delay relationships `systemd-analyze critical-chain`

## Miscelaneous 

See if fsck was run `sudo tune2fs -l /dev/sda6 | grep Last\ c`


