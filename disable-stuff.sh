for serv in fedora-loadmodules plymouth-quit-wait \
        bluetooth systemd-fsck-root \
        avahi-daemon lvm2-monitor
do
    systemctl stop $serv.service
    systemctl disable $serv.service
done
