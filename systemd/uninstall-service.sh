#!/bin/bash

#
# uninstall-service.sh - Uninstall randomize-grub-theme systemd service
#
# Part of bash-tools: Custom Bash Environment Tools
# Copyright (c) 2025 Paul Thompson
# Licensed under MIT License - see LICENSE file for details
#
# Description: This script removes the randomize-grub-theme systemd service
# and disables automatic GRUB theme randomization on boot. Works with services
# installed via the install-service.sh script.
#
# Usage: ./uninstall-service.sh
#

set -euo pipefail

SYSTEMD_DIR="/etc/systemd/system"
SERVICE_NAME="randomize-grub-theme.service"
SERVICE_PATH="$SYSTEMD_DIR/$SERVICE_NAME"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root or with sudo" >&2
    exit 1
fi

echo "Uninstalling randomize-grub-theme systemd service..."

# Stop the service if running
if systemctl is-active --quiet "$SERVICE_NAME"; then
    if systemctl stop "$SERVICE_NAME"; then
        echo "✓ Service stopped"
    else
        echo "WARNING: Failed to stop service (may not be running)" >&2
    fi
fi

# Disable the service if enabled
if systemctl is-enabled --quiet "$SERVICE_NAME" 2>/dev/null; then
    if systemctl disable "$SERVICE_NAME"; then
        echo "✓ Service disabled"
    else
        echo "ERROR: Failed to disable service" >&2
        exit 1
    fi
else
    echo "✓ Service was not enabled"
fi

# Remove service file
if [ -f "$SERVICE_PATH" ]; then
    if rm -f "$SERVICE_PATH"; then
        echo "✓ Service file removed"
    else
        echo "ERROR: Failed to remove service file" >&2
        exit 1
    fi
else
    echo "✓ Service file was not installed"
fi

# Reload systemd daemon
if systemctl daemon-reload; then
    echo "✓ Systemd daemon reloaded"
else
    echo "ERROR: Failed to reload systemd daemon" >&2
    exit 1
fi

echo ""
echo "Uninstallation complete!"
echo ""
echo "The randomize-grub-theme service has been removed and will no longer run on boot."
echo "Your current GRUB theme will remain unchanged until manually modified."