# steamdeck
Collection of scripts for my Steam Deck

## Polkit Rules

Add rules in `/etc/polkit-1/rules.d/`:

- [49-sshd-nopassword.rules](https://github.com/kavishgr/steamdeck/blob/main/polkit-rules/49-sshd-nopassword.rules) - Able to run `systemctl start/stop sshd` without password. 

- [50-wifi-power-management.rules]() - Add []() in `$PATH`. Execute with `pkexec` like so:

```
pkexec wifi-power-save.sh on/off
```


## Grub

- [Disable UMIP](https://github.com/kavishgr/steamdeck/blob/main/grub-modifier-disable-umip.sh)