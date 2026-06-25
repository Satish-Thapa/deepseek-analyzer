#!/usr/bin/env bash
# One-line installer for DeepSeek CLI
set -euo pipefail

REPO="https://raw.githubusercontent.com/Satish-Thapa/deepseek-analyzer/main"
INSTALL_DIR="${HOME}/.local/bin"
DATA_DIR="${HOME}/.deepseek-cli"

echo "⚡ Installing DeepSeek Analyzer..."

# Check deps
for cmd in curl jq awk; do
  command -v "$cmd" &>/dev/null || { echo "✖ Missing: $cmd"; exit 1; }
done

mkdir -p "$INSTALL_DIR" "$DATA_DIR"

curl -sf "$REPO/dsk" -o "$INSTALL_DIR/dsk"
chmod +x "$INSTALL_DIR/dsk"

curl -sf "$REPO/pricing.json" -o "$DATA_DIR/pricing.json"

# Check PATH
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
  echo "⚠ Add to your PATH: export PATH=\"\$HOME/.local/bin:\$PATH\""
fi


echo "✔ Installed! Run: dsk"
