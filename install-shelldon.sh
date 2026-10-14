#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PAYLOAD_DIR="$SCRIPT_DIR/payload"

if [[ ! -d "$PAYLOAD_DIR" ]]; then
  echo "payload directory not found: $PAYLOAD_DIR" >&2
  exit 1
fi

SUDO=""
if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  SUDO="sudo"
fi

install_with_dnf() {
  local pkgs=(
    kitty
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    ImageMagick
    desktop-file-utils
  )
  $SUDO dnf install -y "${pkgs[@]}"
}

install_with_apt() {
  local pkgs=(
    kitty
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    imagemagick
    desktop-file-utils
  )
  $SUDO apt-get update
  $SUDO apt-get install -y "${pkgs[@]}"
}

if command -v dnf >/dev/null 2>&1; then
  echo "[shelldon] using dnf"
  install_with_dnf
elif command -v apt-get >/dev/null 2>&1; then
  echo "[shelldon] using apt"
  install_with_apt
else
  echo "unsupported package manager: need dnf or apt-get" >&2
  exit 1
fi

echo "[shelldon] copying payload to $HOME"
cp -a "$PAYLOAD_DIR/." "$HOME/"
chmod +x "$HOME/bin/shelldon"

# Source templates do not bake one workstation's user path into the bundle.
desktop-file-edit --set-key=TryExec --set-value="$HOME/bin/shelldon" \
  "$HOME/.local/share/applications/shelldon.desktop"
desktop-file-edit --set-key=Exec --set-value="\"$HOME/bin/shelldon\"" \
  "$HOME/.local/share/applications/shelldon.desktop"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$HOME/.local/share/applications" || true
fi

if command -v kbuildsycoca6 >/dev/null 2>&1; then
  kbuildsycoca6 --noincremental || true
elif command -v kbuildsycoca5 >/dev/null 2>&1; then
  kbuildsycoca5 --noincremental || true
fi

echo "[shelldon] running doctor in current shell"
"$HOME/bin/shelldon" doctor || true

if [[ -n "${DISPLAY:-}" || -n "${WAYLAND_DISPLAY:-}" ]]; then
  echo "[shelldon] opening a new Shelldon window and running doctor"
  nohup "$HOME/bin/shelldon" --hold sh -lc '"$HOME/bin/shelldon" doctor; echo; echo "Press Enter to close"; read -r' >/dev/null 2>&1 &
else
  echo "[shelldon] no GUI session detected; skipped opening a new terminal window"
fi

echo "[shelldon] install complete"
