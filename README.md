# Linux tweaks

## General selection philosophy
Pick the distro/software/desktop envrionment/programming language that needs the least amount of work to get it the way you like it.


## My preferred setup and why
Manjaro with i3wm and several addons that are oriented toward usability.

### Why
Manjaro is much easier to install compared to Arch, but still has newer packages than most other distros. It also has access to the AUR, which I miss every time I go to another distro.

The i3 desktop environment is minimal, and has all the keybinds and tools to be productive with windows. It is too minimal though. Authentication does not work until you start polkit in the background, you have to bind keys to change screen brightness and volume, and you still have screen tearing

Look at `.i3/config` if you want to see what I added. 

## Correcting time

Install ntp and do this `sudo timedatectl set-ntp true`
and `sudo timedatectl set-timezone America/Indianapolis` (change the timezone as needed)
and check with `timedatectl status`

## Preferred keybinds
Look at the i3/config file and infer from that.

### Screen tearing

Autostart compton (install it first) with the flags `-b --backend glx --paint-on-overlay --vsync opengl-swc`

## File Open dialog is too big

Change the `GeometryWidth` and `Geom:etryHeight` entries in `.config/gtk-2.0/gtkfilechooser.ini`

## Changing gtk themes on LXQt/i3

Install lxappearance and use it. (lightest option I found that works)

## Input

### Touchpad tap to Click

Make a file: `/etc/X11/xorg.conf.d/30-touchpad.conf`

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
### add authentication to i3-wm

Add this to your .i3/config `exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &`

### makepkg flags/settings (arch-specific)

Go to `/etc/makepkg.conf` and change `makeflags` to `-j4` and C and CXX flags to `-march=native` and `-mtune=native` 

# Linux optimizations

### Lower boot time

Disable services on startup. The fedora section has my personal list. My universal list is here:
+ bluetooth.service
+ ModemManager.service
+ lvm2-monitor.service
also limit journal size by going here:
`/etc/systemd/journald.conf`
and changing the `SystemMaxUse` value.

### Speed up shutdown

Change these settings in `/etc/systemd/system.conf`
```
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s
```
### Change I/O scheduler

To see the sceduler (for /dev/sda): `cat /sys/block/sda/queue/scheduler`
The bracketed option is the current scheduler.

To change the scheduler, use `su` to get superuser status.
Then do: `echo scheduler-name > /sys/block/sda/queue/scheduler`

#### Enable multi-queue schedulers

Add `GRUB_CMDLINE_LINUX="scsi_mod.use_blk_mq=1"` to `/etc/default/grub` and do `sudo grub-mkconfig -o /boot/grub/grub.cfg` or `sudo update-grub` or `sudo grub2-mkconfig -o /boot/grub2/grub.cfg`.

#### Change Scheduler permanently

Add a `elevator=schedulername` entry to the `GRUB_CMDLINE_LINUX_DEFAULT=` line.

#### Permanently change scheduler

Create udev rule in `/etc/udev/rules.d/60-schedulers.rules` and paste in this in that file:
```
#### set scheduler for rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"

#### set scheduler for non-rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*|nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
```

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

### Set up qemu-kvm

Install libvirt qemu-kvm and virt-manager 

Start the libvirtd service and enable it.

Use virt-manager to make the machine.

Add `intel_iommu=on` to `GRUB_CMDLINE_LINUX` in `/etc/default/grub`.

Update grub (fedora) `grub2-mkconfig -o /boot/grub2/grub.cfg`

Add a PCI device in virt-manager.

#### File sharing Linux host Windows Guest.

Go to the folder that you want to share on your guest and go to its properties and share it to everyone. 

Then get the IP address of your Windows guest from control panel. 

Then use `smb://ip-of-guest/foldername` in your file manager on Linux to access that folder.

### Install broadcom-wl (Fedora 27/28) 

`sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

`sudo dnf update`

`sudo dnf install broadcom-wl`

### Install rawhide package

`sudo dnf install fedora-repos-rawhide`

`sudo dnf  install --enablerepo rawhide`

#### Upgrade from rawhide

`sudo dnf --enablerepo rawhide upgrade package-name`

### Install google chrome

`sudo dnf install fedora-workstation-repositories`

`sudo dnf config-manager --set-enabled google-chrome`

`sudo dnf install google-chrome-stable`

### Boot time reduction (Fedora-specific)

Consider removing `/var/log/journal` or renaming it.

Disable plymouth boot screen `sudo dnf remove plymouth`

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

Services you might not want to disable/mask (but I did anyway)

+ firewalld.service (dynamic firewall)
+ rtkit-daemon.service (not much benefit disabling)
+ systemd-journal-flush.service
+ gssproxy.service  (security?, can be uninstalled)
+ udisks2.service (external drive automounting)
+ systemd-rfkill.service (disabling radios)
+ systemd-modules-load.service (it was failing anyway)
+ mlocate-updatedb.service (you can remove by removing mlocate package)

### Arch Specific 

Stuff to remove from arch XFCE (pacman -Rs)
 + orage
 + parole
 + mousepad (use geany instead)
 + ristretto
 + xfburn

Change makepkg flags (especially MAKEFLAGS) in `/etc/makepkg.conf`

Masked for boot:

+ lvm2-monitor.service

Disabled for boot:

+ ModemManager.service
+ bluetooth.service
