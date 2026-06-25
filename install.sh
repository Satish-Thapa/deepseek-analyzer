#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  DeepSeek CLI Installer
# ─────────────────────────────────────────────────────────────
set -euo pipefail

# Colors
if [[ -t 1 ]]; then
  RST='\033[0m'; BOLD='\033[1m'; DIM='\033[2m'
  GREEN='\033[38;5;82m'; RED='\033[38;5;196m'; CYAN='\033[38;5;80m'
  BLUE='\033[38;5;69m'; WHITE='\033[38;5;255m'; YELLOW='\033[38;5;220m'
else
  RST='' BOLD='' DIM='' GREEN='' RED='' CYAN='' BLUE='' WHITE='' YELLOW=''
fi

echo ""
echo -e "${BOLD}${BLUE}╔═════════════════════════════════════════════╗${RST}"
echo -e "${BOLD}${BLUE}║${RST}      ${BOLD}${WHITE} DeepSeek CLI — Installer ${RST}         ${BOLD}${BLUE}║${RST}"
echo -e "${BOLD}${BLUE}╚═════════════════════════════════════════════╝${RST}"
echo ""

# Check dependencies
echo -e "  ${CYAN}▸${RST} Checking dependencies..."
missing=()
for cmd in curl jq awk; do
  if command -v "$cmd" &>/dev/null; then
    echo -e "    ${GREEN}✔${RST} ${WHITE}${cmd}${RST} ${DIM}$(command -v "$cmd")${RST}"
  else
    echo -e "    ${RED}✖${RST} ${WHITE}${cmd}${RST} ${RED}not found${RST}"
    missing+=("$cmd")
  fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
  echo ""
  echo -e "  ${RED}${BOLD}Missing: ${missing[*]}${RST}"
  echo -e "  ${DIM}Install them first, then re-run this script.${RST}"
  exit 1
fi
echo ""

# Install binary
INSTALL_DIR="${HOME}/.local/bin"
DATA_DIR="${HOME}/.deepseek-cli"

echo -e "  ${CYAN}▸${RST} Installing ${WHITE}dsk${RST} to ${DIM}${INSTALL_DIR}${RST}..."
mkdir -p "$INSTALL_DIR"
cp dsk "$INSTALL_DIR/dsk"
chmod +x "$INSTALL_DIR/dsk"
echo -e "    ${GREEN}✔${RST} Binary installed"

# Copy pricing data
echo -e "  ${CYAN}▸${RST} Setting up data directory..."
mkdir -p "$DATA_DIR"
if [[ -f pricing.json ]]; then
  cp pricing.json "$DATA_DIR/pricing.json"
  echo -e "    ${GREEN}✔${RST} Pricing data copied"
fi
echo ""

# Check PATH
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
  echo -e "  ${YELLOW}⚠${RST}  ${WHITE}${INSTALL_DIR}${RST} is not in your PATH"
  echo ""
  echo -e "  ${DIM}Add this to your ~/.bashrc or ~/.zshrc:${RST}"
  echo ""
  echo -e "    ${WHITE}export PATH=\"\$HOME/.local/bin:\$PATH\"${RST}"
  echo ""
fi

# Done
echo -e "  ${GREEN}${BOLD}✔ Installation complete!${RST}"
echo ""
echo -e "  ${DIM}Quick start:${RST}"
echo -e "    ${WHITE}export${RST} ${CYAN}DEEPSEEK_API_KEY${RST}=${DIM}\"sk-xxxxxxxx\"${RST}"
echo -e "    ${WHITE}dsk${RST}              ${DIM}# Dashboard${RST}"
echo -e "    ${WHITE}dsk chat${RST}         ${DIM}# Start chatting${RST}"
echo -e "    ${WHITE}dsk help${RST}         ${DIM}# All commands${RST}"
echo ""
