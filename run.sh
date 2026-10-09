#!/usr/bin/env bash
set -e

sudo apt update
sudo apt install -y git vlc libfuse2t64 xsel xclip wl-clipboard curl podman flatpak htop ffmpeg cups printer-driver-all

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
