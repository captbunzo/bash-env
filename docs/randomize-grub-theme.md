# randomize-grub-theme

Randomly picks a GRUB theme because variety is the spice of life.

## Basic Usage

```bash
sudo randomize-grub-theme
```

## What it does

- Scans `/boot/grub/themes/` for available themes
- Makes sure not to pick the same theme twice in a row
- Backs up your current GRUB config (just one backup file that gets overwritten)
- Updates the GRUB configuration with the new theme
- Runs `update-grub` to apply the changes
- Logs everything to `/var/log/randomize-grub-theme.log`

## Smart Features

- **No repeats**: Won't select the same theme you currently have
- **Validation**: Checks that theme files actually exist and are valid
- **Atomic updates**: Uses temporary files so your config never gets corrupted
- **Auto-recovery**: If anything goes wrong, it restores your backup automatically
- **Timeout protection**: Won't hang if `update-grub` takes too long

## Automatic Execution on Boot

Want a surprise theme every time you boot? Set up the systemd service:

```bash
sudo ./systemd/install-service.sh
```

This installs and enables a systemd service that runs the script on every boot.

### Service Management

```bash
# Check what's happening
sudo systemctl status randomize-grub-theme

# View the logs
sudo journalctl -u randomize-grub-theme

# Run it manually (without waiting for a reboot)
sudo systemctl start randomize-grub-theme

# Turn off automatic execution
sudo ./systemd/uninstall-service.sh
```

## Requirements

- Must be run as root (needs to modify `/etc/default/grub`)
- Requires `update-grub` command (standard on most Debian/Ubuntu systems)
- Needs at least one valid GRUB theme in `/boot/grub/themes/`

## Logs

All activity is logged with timestamps to `/var/log/randomize-grub-theme.log`. Check there if something seems wrong.

## Exit Codes

- `0`: Success (theme changed or no change needed)
- `1`: Error occurred (check the logs)