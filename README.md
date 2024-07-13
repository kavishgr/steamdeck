# steamdeck
Collection of scripts for my Steam Deck

## Decky Loader Plugins

- [Bash Shortcuts](https://github.com/Tormak9970/bash-shortcuts) 
- [Storage Cleaner](https://github.com/mcarlucci/decky-storage-cleaner)
- [Decky Terminal](https://github.com/Alex4386/decky-terminal)
- [CheatDeck](https://github.com/SheffeyG/CheatDeck)

## Polkit

Reasons using polkit:

- Custom sudoers file is not being validated. Need to investigate. 
- `sudo` doesn't work with **Bash Shortcuts**.

> Add rules in `/etc/polkit-1/rules.d/`

### Rules 

- [49-sshd-nopassword.rules](https://github.com/kavishgr/steamdeck/blob/main/polkit-rules/49-sshd-nopassword.rules) - Able to run `systemctl start/stop sshd` without a password. 

In **`.bashrc`** and **`.zshrc`**:

```console
alias start-ssh='systemctl start sshd ; wp-on'
alias stop-ssh='systemctl stop sshd ; wp-off'
```

In **Bash Shortcuts**:

```
start-ssh -> systemctl start sshd
stop-ssh -> systemctl stop sshd
```

- [50-wifi-power-management.rules](https://github.com/kavishgr/steamdeck/blob/main/polkit-rules/50-wifi-power-management.rules) - Add [wifi-set-power-save.sh](https://github.com/kavishgr/steamdeck/blob/main/scripts/wifi-set-power-save.sh) in `$HOME/.tools`. Run the script with `pkexec`:

```
pkexec $HOME/.tools/wifi-set-power-save.sh on/off
```

In **`.bashrc`** and **`.zshrc`**:

```console
alias wp-on='pkexec $HOME/.tools/wifi-set-power-save.sh on'
alias wp-off='pkexec $HOME/.tools/wifi-set-power-save.sh off'
```

In **Bash Shortcuts**:

```
wp-on -> pkexec $HOME/.tools/wifi-set-power-save.sh on
wp-off -> pkexec $HOME/.tools/wifi-set-power-save.sh off
```

## Grub

- [Disable UMIP](https://github.com/kavishgr/steamdeck/blob/main/grub/grub-modifier-disable-umip.sh)