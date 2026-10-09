#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

if ! command -v sudo >/dev/null 2>&1; then
  echo "Error: sudo is required but not installed." >&2
  exit 1
fi

if ! sudo -v; then
  echo "Error: sudo privileges are required." >&2
  exit 1
fi

if [ -r /etc/os-release ]; then
  . /etc/os-release
  if [ "${ID:-}" != "debian" ] && [ "${ID_LIKE:-}" != *"debian"* ]; then
    echo "Warning: this script targets Debian (detected: ${ID:-unknown}). Continuing anyway."
  fi
fi

echo "==> Updating apt..."
sudo apt-get update

echo "==> Installing essentials..."
sudo apt-get install -y git vlc libfuse2t64 wl-clipboard curl wget podman flatpak htop ffmpeg cups printer-driver-all fonts-noto fonts-noto-color-emoji unzip zip

echo "==> Adding Flathub remote..."
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Flatpak backend for the detected desktop
DESKTOP_ENV="${XDG_CURRENT_DESKTOP:-} ${DESKTOP_SESSION:-} ${XDG_SESSION_DESKTOP:-}"

shopt -s nocasematch

if [[ "$DESKTOP_ENV" == *gnome* ]] || command -v gnome-shell >/dev/null 2>&1; then
  echo "GNOME detected: installing gnome-software-plugin-flatpak"
  sudo apt install -y gnome-software-plugin-flatpak
elif [[ "$DESKTOP_ENV" == *kde* ]] || [[ "$DESKTOP_ENV" == *plasma* ]] || command -v plasmashell >/dev/null 2>&1; then
  echo "KDE Plasma detected: installing plasma-discover-backend-flatpak"
  sudo apt install -y plasma-discover-backend-flatpak
else
  echo "No GNOME/KDE desktop detected, skipping Flatpak desktop plugin."
fi
