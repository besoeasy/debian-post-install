# Debian Post-Install

[![Debian](https://img.shields.io/badge/Debian-12%2B-A81D33?logo=debian&logoColor=white)](https://www.debian.org/)
[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnubash&logoColor=white)](./run.sh)
[![Flatpak](https://img.shields.io/badge/Flatpak-Flathub-4A90D9?logo=flatpak&logoColor=white)](https://flathub.org/)
[![Podman](https://img.shields.io/badge/Podman-Containers-892CA0?logo=podman&logoColor=white)](https://podman.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Minimal, opinionated setup script to run after a fresh Debian installation. Updates apt, installs daily essentials, configures Flatpak + Flathub, and auto-installs the correct Flatpak backend for GNOME or KDE Plasma.

## Features

- One-command bootstrap for fresh Debian systems
- Installs dev, media, container, and clipboard tools in one pass
- Configures Flathub as a user Flatpak remote
- Auto-detects desktop environment:
  - GNOME → `gnome-software-plugin-flatpak`
  - KDE Plasma → `plasma-discover-backend-flatpak`
- Idempotent where possible, `set -euo pipefail` for fail-fast behavior

## Quick Start

Run directly from jsDelivr (installs `curl` first for minimal netinstalls):

```bash
sudo apt update && sudo apt install -y curl && curl -fsSL https://cdn.jsdelivr.net/gh/besoeasy/debian-post-install@main/run.sh | bash
```

## Manual Usage

```bash
git clone https://github.com/besoeasy/debian-post-install.git
cd debian-post-install
chmod +x run.sh
./run.sh
```

Requirements: Debian 12+ with `sudo` privileges and an internet connection.

## What Gets Installed

| Package | Purpose |
| --- | --- |
| `git` | Version control and cloning repositories |
| `vlc` | Full-featured audio/video media player |
| `libfuse2t64` | FUSE 2 runtime required to launch AppImages |
| `wl-clipboard` | Wayland clipboard utilities (`wl-copy` / `wl-paste`) |
| `curl` | HTTP(S) downloads and API access |
| `podman` | Daemonless OCI container engine |
| `flatpak` | Sandboxed application distribution |
| `htop` | Interactive process viewer and system monitor |
| `ffmpeg` | Audio/video codecs, conversion, and thumbnails |
| `cups` | Print spooler and print server |
| `printer-driver-all` | Meta-package with common printer drivers |
| `Flathub remote` | Default Flatpak app repository |
| `gnome-software-plugin-flatpak` | Flatpak integration for GNOME Software (GNOME only) |
| `plasma-discover-backend-flatpak` | Flatpak backend for Plasma Discover (KDE only) |

## How It Works

1. Verifies `sudo` access and Debian OS, then `sudo apt-get update`
2. Installs: `git vlc libfuse2t64 wl-clipboard curl podman flatpak htop ffmpeg cups printer-driver-all`
3. Adds Flathub: `flatpak remote-add --if-not-exists --user flathub ...`
4. Detects desktop via `$XDG_CURRENT_DESKTOP` / `$DESKTOP_SESSION` / `$XDG_SESSION_DESKTOP`, with `gnome-shell` / `plasmashell` fallback, then installs the matching backend

See [`run.sh`](./run.sh) — short and auditable, easy to review before running.

## Contributing

Issues and PRs welcome. Keep it minimal: essential, widely-useful Debian defaults only.

## License

MIT — see [LICENSE](./LICENSE).
