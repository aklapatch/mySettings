# Distro configuration
Arch, Manjaro, or Debian testing as distro. Arch is preferred since it is lighter. Arch and Manjaro also have the AUR, so both of them are preferred over Debian testing.

## Desktop config
i3 wm with xfce4 as a regular desktop. 

## Things to install
+ visual studio code
+ python
+ git
+ clang
+ vivaldi (and winedevine)
+ firefox
+ virt-manager and kvm and qemu
+ i3 config files
+ geany and its plugins
+ xfce and i3 (appropriate widgets too)
+ config files for intel graphics and the touchpad and evdev
+ pamac
+ gnome polkit agent
+ oh-my-zsh
+ vim completions
+ vim 
+ ninja
+ cmake
+ cppcheck
+ wine

# Backup steps

## Touchpad tap to Click

Make a file: `/etc/X11/xorg.conf.d/30-touchpad.conf`

Paste this in it:
```
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
```

## Disable touch screen on boot

find this section in `/usr/share/X11/xorg.conf.d/10-evdev.conf` 

```
Section "InputClass"
    	Identifier "evdev touchscreen catchall"
        MatchIsTouchscreen "on"
        Driver "evdev"
    	Option "Ignore" "true"
EndSection
```

## add authentication to i3-wm

Add this to your .i3/config `exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &`
