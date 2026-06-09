#!/bin/bash

# Usuario actual
USER_NAME="$USER"

# Carpeta destino
DEST="/home/$USER_NAME/CIAA/workspaces/embedded-ide-ws/templates"

# Repositorio
REPO="ciaa/EmbeddedIDE-templates"

mkdir -p "$DEST"
cd "$DEST" || exit 1

# Descargar todos los .template
curl -s "https://api.github.com/repos/$REPO/contents" | \
  jq -r '.[] | select(.name | endswith(".template")) | .download_url' | \
  while read -r url; do
    fname=$(basename "$url")
    echo "Descargando $fname..."
    curl -s -L -o "$fname" "$url"
  done

echo "Descarga finalizada en $DEST"
