#!/bin/bash

THEME_DIR="/boot/grub/themes/coquette-clean"

sudo mkdir -p "$THEME_DIR"
sudo cp -r * "$THEME_DIR"

sudo sed -i '/^GRUB_THEME=/d' /etc/default/grub
echo "GRUB_THEME=\"$THEME_DIR/theme.txt\"" | sudo tee -a /etc/default/grub

sudo update-grub
echo "Tema Coquette Clean instalado com sucesso! 💖"
