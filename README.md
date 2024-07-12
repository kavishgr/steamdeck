# steamdeck
Collection of scripts for my Steam Deck

## Polkit Rules

Add rules in `/etc/polkit-1/rules.d/`:

- [49-sshd-nopassword.rules](https://github.com/kavishgr/steamdeck/blob/main/polkit-rules/49-sshd-nopassword.rules) - Able to run `systemctl start/stop sshd` without password. 

- TODO: Turn on/off WIFI power management. In the meantime run: 
```
sudo iw wlan0 set power_save off
```

## Grub

- [Disable UMIP](https://github.com/kavishgr/steamdeck/blob/main/grub-modifier-disable-umip.sh)