#!/bin/bash
set -e

# Detectar el home del usuario real
USER_NAME="${SUDO_USER:-$(whoami)}"
USER_HOME="/home/$USER_NAME"

echo "==================================================="
echo " CIAA-Launcher Automatic Installer for Ubuntu/Debian "
echo "==================================================="

# 1. Instalar dependencias necesarias
echo "[1/6] Installing required dependencies..."
if command -v apt &>/dev/null; then
    sudo apt update
    sudo apt install -y jq unzip openocd git build-essential curl gtkterm cutecom
else
    echo "⚠ Could not detect apt. Please install dependencies manually."
    exit 1
fi

# 2. Descargar CIAA-Launcher
echo "[2/6] Downloading CIAA-Launcher..."
mkdir -p "$USER_HOME/CIAA"
cd "$USER_HOME/CIAA"

if [ ! -f CIAA_Software_1.1-linux-x64.tar.xz ]; then
    curl -L -o CIAA_Software_1.1-linux-x64.tar.xz \
    https://github.com/epernia/software/releases/download/r1.1.0/CIAA_Software_1.1-linux-x64.tar.xz

    echo "Extracting CIAA-Launcher..."
    tar -xf CIAA_Software_1.1-linux-x64.tar.xz -C "$USER_HOME/CIAA" --strip-components=1
    rm -f CIAA_Software_1.1-linux-x64.tar.xz
    if [ -d "$USER_HOME/CIAA/CIAA_Software_1.1-linux-x64" ]; then
        rm -rf "$USER_HOME/CIAA/CIAA_Software_1.1-linux-x64"
    fi
fi

# 3. Descargar firmware_v3
echo "[3/6] Downloading firmware_v3..."
cd "$USER_HOME/CIAA"
if [ ! -f r1.3.0.zip ]; then
    curl -L -o r1.3.0.zip \
    https://github.com/epernia/firmware_v3/archive/refs/tags/r1.3.0.zip
fi

echo "Extracting firmware_v3..."
unzip -qo r1.3.0.zip -d "$USER_HOME/CIAA"
rm -f r1.3.0.zip

# 4. Crear acceso en el menú
echo "[4/6] Creating desktop entry..."
mkdir -p "$USER_HOME/.local/share/applications"
cat > "$USER_HOME/.local/share/applications/CIAA-Launcher.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=CIAA-Launcher
Exec=$USER_HOME/CIAA/CIAA-Launcher
Icon=utilities-terminal
Terminal=false
Categories=Utility;
EOF

chmod +x "$USER_HOME/.local/share/applications/CIAA-Launcher.desktop"

# 5. Descargar plantillas de Embedded IDE
echo "[5/6] Downloading Embedded IDE templates..."
DEST="$USER_HOME/CIAA/workspaces/embedded-ide-ws/templates"
mkdir -p "$DEST"
REPO="ciaa/EmbeddedIDE-templates"

cd "$DEST" || exit 1

curl -s "https://api.github.com/repos/$REPO/contents" | \
  jq -r '.[] | select(.name | endswith(".template")) | .download_url' | \
  while read -r url; do
    fname=$(basename "$url")
    echo " → Downloading $fname..."
    curl -s -L -o "$fname" "$url"
  done

# 6. Configurar permisos de puertos serie
echo "[6/6] Configuring permissions for serial ports..."
sudo usermod -aG dialout,plugdev "$USER_NAME"

bash "$USER_HOME/CIAA/embedded-ide/usr/bin/ftdi-tools.sh" --install

# ---------- Cargar módulo FTDI ----------
echo "[*] Loading FTDI kernel module..."
if lsmod | grep -q "^ftdi_sio"; then
    echo "Module ftdi_sio already loaded."
else
    if modinfo ftdi_sio &>/dev/null; then
        sudo modprobe ftdi_sio
        echo "Module ftdi_sio loaded successfully."
    else
        echo "Warning: Module ftdi_sio not found on this system."
    fi
fi

echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", MODE="0666"' | \
sudo tee /etc/udev/rules.d/99-ftdi.rules

sudo udevadm control --reload-rules
sudo udevadm trigger

# ---------- Fix OpenOCD en CIAA ----------
echo "[*] Applying OpenOCD fix..."
if [ -f "$USER_HOME/CIAA/tools/openocd/bin/librt.so.1" ]; then
    mv "$USER_HOME/CIAA/tools/openocd/bin/librt.so.1" \
       "$USER_HOME/CIAA/tools/openocd/bin/librt.so.1.bak"
fi

echo "[*] Installation finished ✅"
echo "Please log out and back in for group changes to take effect."

echo "=============================================================="
echo "                    Installation completed!                   "
echo " You can now launch CIAA-Launcher from rofi or your app menu. "
echo " firmware_v3 installed in: $USER_HOME/CIAA/firmware_v3-r1.3.0 "
echo "=============================================================="
