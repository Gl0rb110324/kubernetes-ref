#!/bin/sh

echo "Configuring Cron"
for i in crontab cron.hourly cron.daily cron.weekly cron.monthly cron.deny; do
  chown root:root /etc/$i
  chmod 600 /etc/$i
done
chmod 700 /etc/cron.d

echo "Verifying System File Permissions"
#(6.4) 10690 Status of the Permissions set for the '/etc/passwd-' file
chmod 600 /etc/passwd-
#(6.6) 2188 Permissions set for the '/etc/shadow' file
chmod 000 /etc/shadow
chmod 000 /etc/gshadow
chmod 644 /etc/group
# grub.cfg won't exist on an EFI system
if [ -f /boot/grub2/grub.cfg ]; then
 chmod 600 /boot/grub2/grub.cfg
fi
chmod 600 /etc/at.deny
chmod 750 /etc/sudoers.d
chmod 600 /etc/rsyslog.conf
chown root:root /etc/passwd
chown root:root /etc/shadow
chown root:root /etc/gshadow
chown root:root /etc/group
# reset mod

upgrade_path=/etc/ssh/sshd_config
chown root:root ${upgrade_path}
chmod 600 ${upgrade_path}
chmod 0600 /etc/ssh/ssh_host*key