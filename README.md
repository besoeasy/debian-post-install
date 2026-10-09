# debian-post-install

Minimal setup to run after a fresh Debian installation.

## What it does

`run.sh`:
1. Updates apt and installs essentials: `git`, `vlc`, `libfuse2t64`, `xsel`, `xclip`, `curl`, `podman`, `flatpak`
2. Adds Flathub as a user Flatpak remote (if not already added)

## Usage

Run directly from jsDelivr (one-liner):

```bash
curl -fsSL https://cdn.jsdelivr.net/gh/besoeasy/debian-post-install@main/run.sh | bash
```

Or clone and run locally:

```bash
chmod +x run.sh
./run.sh
```

Requires Debian with `sudo` privileges.

## Packages

| Package | Use |
| --- | --- |
| `git` | Version control, clone repos |
| `vlc` | Media player for audio/video |
| `libfuse2t64` | FUSE 2 support, needed to run AppImages |
| `xsel` | Command-line X selection / clipboard access |
| `xclip` | Command-line X clipboard copy/paste |
| `curl` | Transfer data via HTTP(S), download files/scripts |
| `podman` | Daemonless container engine for OCI containers |
| `flatpak` | Sandboxed app distribution system |
| `Flathub remote` | Default Flatpak app repository source |
