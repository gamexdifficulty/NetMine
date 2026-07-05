#!/bin/bash

set -e

SYSTEMD_DIR="$HOME/.config/systemd/user"

echo "Uninstalling NetMine..."

systemctl --user stop netmine-backend.service 2>/dev/null || true
systemctl --user stop netmine-frontend.service 2>/dev/null || true

systemctl --user disable netmine-backend.service 2>/dev/null || true
systemctl --user disable netmine-frontend.service 2>/dev/null || true

rm -f "$SYSTEMD_DIR/netmine-backend.service"
rm -f "$SYSTEMD_DIR/netmine-frontend.service"

systemctl --user daemon-reload
loginctl disable-linger "$USER" 2>/dev/null || true

echo
echo "NetMine services have been removed."
echo