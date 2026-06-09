# Scripts de Instalación CIAA

Este directorio contiene scripts de automatización para configurar el entorno de desarrollo CIAA en diferentes distribuciones de Linux.

## Descripción General

Los scripts descargan e instalan automáticamente todas las herramientas, dependencias y componentes necesarios para trabajar con CIAA (Computadora Industrial Abierta Argentina).

Todos los scripts descargan los componentes en: **`/home/usuario/CIAA`**

---

## Scripts Disponibles

### 1. `epernia-arch-setup.sh` (Arch Linux)

**Propósito:** Instalación automática completa para Arch Linux y derivados (Manjaro, Endeavour, etc.)

**Qué instala:**
- Dependencias del sistema necesarias (jq, unzip, openocd)
- CIAA-Launcher v1.1 (compilador y herramientas de desarrollo)
- Firmware_v3 (firmware del proyecto)
- EmbeddedIDE (entorno integrado de desarrollo)
- **Templates de Embedded IDE** (plantillas de proyectos)

**Uso:**
```bash
chmod +x epernia-arch-setup.sh
sudo ./epernia-arch-setup.sh
```

**Ubicación de descarga:** `/home/usuario/CIAA/`

---

### 2. `epernia-debian-setup.sh` (Debian/Ubuntu)

**Propósito:** Instalación automática completa para Ubuntu, Debian y distribuciones basadas en apt.

**Qué instala:**
- Dependencias del sistema (jq, unzip, openocd, git, build-essential, gtkterm, cutecom)
- CIAA-Launcher v1.1 (compilador y herramientas de desarrollo)
- Firmware_v3 (firmware del proyecto)
- EmbeddedIDE (entorno integrado de desarrollo)
- **Templates de Embedded IDE** (plantillas de proyectos)

**Uso:**
```bash
chmod +x epernia-debian-setup.sh
sudo ./epernia-debian-setup.sh
```

**Ubicación de descarga:** `/home/usuario/CIAA/`

---

### 3. `download-embedded-ide-templates.sh` (Descarga Individual de Templates)

**Propósito:** Descargar únicamente los templates de Embedded IDE sin necesidad de ejecutar la instalación completa. **Útil si la instalación completa falla o solo necesitas actualizar los templates.**

**Qué descarga:**
- Todos los templates (`.template`) disponibles del repositorio oficial
- Los templates son archivos de plantillas para crear nuevos proyectos en Embedded IDE

**Ubicación de descarga (modificable):**
```bash
DEST="/home/$USER_NAME/CIAA/workspaces/embedded-ide-ws/templates"
```

**Cómo usar:**

1. Abre el script en un editor de texto:
   ```bash
   nano download-embedded-ide-templates.sh
   ```

2. Si deseas cambiar la ubicación de descarga, modifica la línea:
   ```bash
   DEST="/home/$USER_NAME/CIAA/workspaces/embedded-ide-ws/templates"
   ```
   
   Por ejemplo, para descargar en otra ubicación:
   ```bash
   DEST="/ruta-personalizada/workspaces/embedded-ide-ws/templates"
   ```

3. Ejecuta el script:
   ```bash
   chmod +x download-embedded-ide-templates.sh
   ./download-embedded-ide-templates.sh
   ```



---

## Notas Importantes

**Los templates se incluyen automáticamente** en los scripts `epernia-arch-setup.sh` y `epernia-debian-setup.sh`

**Usa `download-embedded-ide-templates.sh` solo si:**
- La instalación sin los scripts falla y necesitas recuperar los templates
- Deseas actualizar los templates sin reinstalar todo
- Solo tienes conexión para descargar templates