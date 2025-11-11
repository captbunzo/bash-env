#!/bin/bash

#
# install-service.sh - Install randomize-grub-theme systemd service
#
# Part of bash-tools: Custom Bash Environment Tools
# Copyright (c) 2025 Paul Thompson
# Licensed under MIT License - see LICENSE file for details
#
# Description: This script installs and enables the randomize-grub-theme
# systemd service for automatic GRUB theme randomization on boot.
#
# Usage: ./install-service.sh
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASH_TOOLS="$(cd "$SCRIPT_DIR/.." && pwd)"

SYSTEMD_DIR="/etc/systemd/system"
SERVICE_FILE="$SCRIPT_DIR/system/randomize-grub-theme.service"
SERVICE_NAME="randomize-grub-theme.service"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root or with sudo" >&2
    exit 1
fi

# Check if service file exists
if [ ! -f "$SERVICE_FILE" ]; then
    echo "ERROR: Service file not found: $SERVICE_FILE" >&2
    exit 1
fi

echo "Installing randomize-grub-theme systemd service..."
echo "Using bash-tools directory: $BASH_TOOLS"

# Create a temporary service file with paths configured
TEMP_SERVICE=$(mktemp) || {
    echo "ERROR: Failed to create temporary file" >&2
    exit 1
}

# Replace placeholder with actual path
sed "s|{BASH_TOOLS}|$BASH_TOOLS|g" "$SERVICE_FILE" > "$TEMP_SERVICE"

# Copy the configured service file to systemd directory
if cp "$TEMP_SERVICE" "$SYSTEMD_DIR/$SERVICE_NAME"; then
    echo "✓ Service file configured and copied to $SYSTEMD_DIR/"
else
    echo "ERROR: Failed to copy service file" >&2
    rm -f "$TEMP_SERVICE"
    exit 1
fi

# Clean up temporary file
rm -f "$TEMP_SERVICE"

# Reload systemd daemon
if systemctl daemon-reload; then
    echo "✓ Systemd daemon reloaded"
else
    echo "ERROR: Failed to reload systemd daemon" >&2
    exit 1
fi

# Enable the service
if systemctl enable "$SERVICE_NAME"; then
    echo "✓ Service enabled for automatic startup"
else
    echo "ERROR: Failed to enable service" >&2
    exit 1
fi

echo ""
echo "Installation complete!"
echo ""
echo "The randomize-grub-theme service is now installed and will run on every boot."
echo ""
echo "Management commands:"
echo "  Check status:    sudo systemctl status $SERVICE_NAME"
echo "  Start manually:  sudo systemctl start $SERVICE_NAME"
echo "  Stop service:    sudo systemctl stop $SERVICE_NAME"
echo "  Disable service: sudo systemctl disable $SERVICE_NAME"
echo "  View logs:       sudo journalctl -u $SERVICE_NAME"
echo ""
echo "The service will automatically randomize your GRUB theme on the next boot."