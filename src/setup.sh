#!/bin/bash

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
SYSTEMD_DIR="$HOME/.config/systemd/user"

echo "Installing NetMine..."

mkdir -p "$SYSTEMD_DIR"

sed "s|%PROJECT_DIR%|$PROJECT_DIR|g" services/netmine-backend.service > "$SYSTEMD_DIR/netmine-backend.service"
sed "s|%PROJECT_DIR%|$PROJECT_DIR|g" services/netmine-frontend.service > "$SYSTEMD_DIR/netmine-frontend.service"

systemctl --user daemon-reload

systemctl --user enable netmine-backend.service
systemctl --user enable netmine-frontend.service

systemctl --user start netmine-backend.service
systemctl --user start netmine-frontend.service

loginctl enable-linger "$USER"

echo
echo "Installation completed."
echo