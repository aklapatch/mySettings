# Programs
+ IDE : Codelite or Qt Creator
+ Medium code editor : Visual Studio Code
+ Photo editing : Gimp
+ Video editing : Shotcut
+ Audio editing : Audacity
+ light code editor : vim
+ mingw-w64-gcc or clang for cross-compilation
+ wine : run windows programs

# Linux tweaks
## Keybinds
+ Win + a : maximize screen
+ Win + q : close window
+ Win + ] : tile window right
+ Win + [ : tilewindow left
+ Win + m : bring up start menu
+ Win + s : bring up search dialog
+ Win + f : start file manager
+ Win + t : start terminal

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

## Input

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

### Disable touch screen on boot

find this section in `/usr/share/X11/xorg.conf.d/10-evdev.conf` 

```
Section "InputClass"
        Identifier "evdev touchscreen catchall"
        MatchIsTouchscreen "on"
        MatchDevicePath "/dev/input/event*"
        Driver "evdev"
EndSection
```
and change it to this

```
Section "InputClass"
    	Identifier "evdev touchscreen catchall"
        MatchIsTouchscreen "on"
        Driver "evdev"
	Option "Ignore" "true"
EndSection
```

# Linux optimizations

### Lower boot time

Disable services on startup. The fedora section has my personal list

## Useful Commands/tools

See if fsck was run `sudo tune2fs -l /dev/sda6 | grep Last\ c`

List loaded services `systemctl list-unit-files | grep enabled`

### Disabling Services

Use `systemctl disable service-name.service`

Masking (stronger disable) `sudo systemctl mask service-name.service`

### Enabling services

Enable: `sudo systemctl enable service-name.service` 

Unmasking: `sudo systemctl unmask service-name.service`

OR

reinstall service/package or delete symlink `/lib/systemd/system/service-name.service`
Then run sudo systemctl `daemon-reload`
To check is symlink goes to /dev/null sudo file `/lib/systemd/system/service-name.service`

### Boot analysis

Display time to load each service `systemd-analyze blame`

Show last boot times and stats `systemd-analyze`

Plot service load times `systemd-analyze plot > boot.svg`

Show dependencies and delay relationships `systemd-analyze critical-chain`

## Fedora-specific tweaks

Get rid of old kernels. `dnf remove $(dnf repoquery --installonly --latest-limit 2 -q)`

The number is the number of kernels that should be left.

OR

Set kernel limit in `/etc/dnf/dnf.conf` as such `installonly_limit=2`

### Boot time reduction (Fedora-specific)

Consider removing `/var/log/journal` or renaming it.

Disable plymouth boot screen `sudo dnf remove plymouth`

Remove dracut as well `sudo dnf remove dracut` (removes abrtd)

Please note that not all these options were tested.

Services I disabled (I am not responsible for you FUBARing your system):

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
+ chronyd.service
+ vmtoolsd.service

Services you might not want to disable (but I did anyway)

+ firewalld.service (dynamic firewall))
+ rtkit-daemon.service (not much benefit disabling)
+ systemd-journal-flush.service
+ fedora-import-state.service
+ gssproxy.service  (security?)
+ udisks2.service (still runs even if you mask it)

Services I had to mask

+ var-lib-nfs-rpc_pipefs.mount (probably will break pipes)
+ the systemd-fsck service  (still runs even when masked)
+ chronyd.service    (time synchro, designed for VM's)
+ systemd-tmpfiles-setup.service (does not stay masked)
+ systemd-update-utmp.service (does not stay masked)
+ gssproxy.service
+ nfs-config.service (network filesystem, took a second off boot)
+ sys-kernel-debug.mount
+ dnfdaemon.service  (dnf autostart)
