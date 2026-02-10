# Dotfiles

Configuración personal de desarrollo para macOS.

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
  - [1. Homebrew](#1-homebrew)
  - [2. Zsh y Oh My Zsh](#2-zsh-y-oh-my-zsh)
  - [3. WezTerm](#3-wezterm)
  - [4. Neovim](#4-neovim)
  - [5. Visual Studio Code](#5-visual-studio-code)
  - [6. NVM (Node Version Manager)](#6-nvm-node-version-manager)
  - [7. Tmux](#7-tmux)
  - [8. GNU Stow](#8-gnu-stow)
  - [9. Herramientas Adicionales](#9-herramientas-adicionales)
- [Configuración](#configuración)
- [Estructura del Repositorio](#estructura-del-repositorio)

## 🚀 Requisitos Previos

- macOS
- Acceso a Terminal
- Permisos de administrador

## 📦 Instalación

### 1. Homebrew

Homebrew es el gestor de paquetes para macOS. Instálalo ejecutando:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Después de la instalación, asegúrate de seguir las instrucciones en pantalla para agregar Homebrew a tu PATH.

### 2. Zsh y Oh My Zsh

Zsh ya viene instalado en macOS por defecto. Para configurar Oh My Zsh:

```bash
# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar plugins necesarios
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 3. WezTerm

WezTerm es un terminal moderno y configurable:

```bash
brew install --cask wezterm
```

### 4. Neovim

Neovim es un editor de texto extensible:

```bash
brew install neovim
```

### 5. Visual Studio Code

Visual Studio Code es un editor de código moderno y extensible:

```bash
brew install --cask visual-studio-code
```

### 6. NVM (Node Version Manager)

NVM te permite gestionar múltiples versiones de Node.js:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Instalar la última versión LTS de Node.js
nvm install --lts
nvm use --lts
```

### 7. Tmux

Tmux es un multiplexor de terminal:

```bash
brew install tmux
```

### 8. GNU Stow

GNU Stow es una herramienta para gestionar symlinks de forma automática y organizada:

```bash
brew install stow
```

### 8. Herramientas Adicionales

Instala herramientas adicionales utilizadas en la configuración:

```bash
# eza - reemplazo moderno de ls
brew install eza

# Git (versión actualizada)
brew install git
```

## ⚙️ Configuración

### Clonar este repositorio

```bash
cd ~
git clone <tu-repositorio-url> dotfiles
cd dotfiles
```

### Crear symlinks con GNU Stow

GNU Stow facilita la gestión de symlinks automáticamente. Desde el directorio de dotfiles:

```bash
cd ~/dotfiles

# Aplicar todas las configuraciones
stow zsh git nvim tmux wezterm

# O aplicar una por una
stow zsh
stow git
stow nvim
stow tmux
stow wezterm

# Para VS Code (requiere especificar el directorio target)
# Nota: VS Code guarda configuración en Library/Application Support/Code/User/
# Ver sección de "Alternativa: Crear symlinks manualmente" para el método correcto
```

Stow creará automáticamente los symlinks en tu directorio home (`~`) apuntando a los archivos en `~/dotfiles`.

#### Alternativa: Crear symlinks manualmente

Si prefieres no usar Stow, puedes crear los enlaces simbólicos manualmente:

```bash
# Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# Git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

# Neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/.config/nvim/init.lua ~/.config/nvim/init.lua

# Tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# WezTerm
mkdir -p ~/.config/wezterm
ln -sf ~/dotfiles/wezterm/.wezterm.lua ~/.config/wezterm/wezterm.lua

# VS Code (configuración global de usuario)
ln -sf ~/dotfiles/vscode/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

### Archivo de entorno local

Crea un archivo para variables de entorno locales (este archivo no se incluye en el repositorio):

```bash
touch ~/.zshenv.local
```

Agrega tus variables de entorno personales en `~/.zshenv.local` (API keys, tokens, etc.)

### Recargar configuración

```bash
# Recargar Zsh
source ~/.zshrc
```

## 📁 Estructura del Repositorio

```
dotfiles/
├── vscode/      # Configuración de VS Code
├── git/          # Configuración de Git
├── nvim/         # Configuración de Neovim
├── tmux/         # Configuración de Tmux
├── wezterm/      # Configuración de WezTerm
├── zsh/          # Configuración de Zsh
└── README.md     # Este archivo
```

## 🎨 Personalización

### Aliases disponibles

El archivo `.zshrc` incluye varios aliases útiles:

- `vim` → `nvim` - Usa Neovim en lugar de Vim
- `ll` → `eza -la --icons -l -G` - Lista detallada con iconos
- `lt` → `eza -la --tree --level=2 --icons` - Vista de árbol
- `ls` → `eza -la -1 --icons -G --classify` - Lista simple con iconos
- `dotfiles` → Navega al directorio de dotfiles
- `gitconfig` → Edita la configuración de Git
- `zshconfig` → Edita la configuración de Zsh
- `nvimconfig` → Edita la configuración de Neovim
- `workspace` → Navega a tu directorio de workspace
- `open-repo` → Abre el repositorio actual en el navegador

### Keybindings

- `Ctrl+E` - Ejecutar sugerencia automática
- `Ctrl+A` - Aceptar sugerencia automática

## 📝 Notas

- Asegúrate de revisar cada archivo de configuración y personalizarlo según tus preferencias
- Haz backup de tus configuraciones existentes antes de crear los symlinks
- El archivo `~/.zshenv.local` es para variables de entorno sensibles y no debería incluirse en el repositorio
- **GNU Stow** espera que los archivos estén organizados de manera que reflejen la estructura del directorio home. Por ejemplo, `~/dotfiles/zsh/.zshrc` se enlazará a `~/.zshrc`
- Para eliminar symlinks creados con Stow, usa: `stow -D <paquete>` (ejemplo: `stow -D zsh`)
- **VS Code**: La configuración es global de usuario y se encuentra en `~/Library/Application Support/Code/User/settings.json`. Para crear el symlink manualmente usa el comando que aparece en la sección de "Alternativa: Crear symlinks manualmente". También puedes usar Stow especificando el directorio target: `stow -t ~/Library/Application\ Support/Code/User .vscode`