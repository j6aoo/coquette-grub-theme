#!/bin/bash

THEME_DIR="/boot/grub/themes/coquette-clean"
echo "🎀 Instalando tema Coquette Clean..."

# Habilita extglob pra excluir install.sh
shopt -s extglob

# Cria diretório do tema
sudo mkdir -p "$THEME_DIR"

# Copia arquivos (exceto o script)
sudo cp -r !(install.sh) "$THEME_DIR"

# Atualiza o GRUB_THEME no arquivo de configuração
sudo sed -i '/^GRUB_THEME=/d' /etc/default/grub
echo "GRUB_THEME=\"$THEME_DIR/theme.txt\"" | sudo tee -a /etc/default/grub

# Atualiza o GRUB
if command -v update-grub &> /dev/null; then
    sudo update-grub
else
    sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "✨ Tema Coquette Clean instalado com sucesso! Vá brilhar no boot, princesa! 💖"
