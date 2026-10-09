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
