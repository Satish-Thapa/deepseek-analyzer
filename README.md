<h1 align="center">⚡ DeepSeek CLI</h1>

<p align="center">
  <strong>A beautiful terminal dashboard for the DeepSeek API</strong><br>
  <em>Check your balance, estimate costs, and chat — all from the command line.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/bash-5.0%2B-blue?logo=gnu-bash" alt="Bash">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT License">
  <img src="https://img.shields.io/badge/version-1.0.0-orange" alt="Version">
</p>

---

## Features

- **Rich Dashboard** — Colorful account overview with balance bar, models, and token capacity
- **Interactive Chat** — Chat directly with DeepSeek models from your terminal
- **Cost Estimator** — Calculate costs before you spend
- **History Tracking** — All API calls and chats are logged locally
- **Beautiful Output** — ANSI colors, box drawing, and Unicode icons
- **Fast & Lightweight** — Pure bash, no heavy dependencies

## Requirements

| Tool   | Purpose         |
| ------ | --------------- |
| `bash` | Shell (5.0+)    |
| `curl` | API requests    |
| `jq`   | JSON parsing    |
| `awk`  | Math operations |

## Installation

```bash
curl -sL https://raw.githubusercontent.com/Satish-Thapa/deepseek-analyzer/main/remote-install.sh | bash
```

## Configuration

Set your DeepSeek API key:

```bash
export DEEPSEEK_API_KEY="sk-xxxxxxxxxxxxxxxx"
```

Add it to your `~/.bashrc` or `~/.zshrc` to persist:

```bash
echo 'export DEEPSEEK_API_KEY="sk-xxxx"' >> ~/.bashrc
```

> Get your API key at [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys)

## Usage

### Dashboard (default)

```bash
dsk
```

Shows account status, balance, available models, and token capacity estimates.

### Interactive Chat

```bash
dsk chat                     # Uses deepseek-v4-flash
dsk chat deepseek-v4-pro     # Use a specific model
```

### Cost Estimator

```bash
dsk cost 5000000                      # 5M tokens, default model
dsk cost 1000000 deepseek-v4-pro      # 1M tokens, specific model
```

### Other Commands

```bash
dsk balance       # Raw balance JSON
dsk models        # Raw models JSON
dsk history       # Recent activity log
dsk history 20    # Last 20 entries
dsk help          # All commands
dsk --version     # Version info
```

## Data Storage

All data is stored in `~/.deepseek-cli/`:

```
~/.deepseek-cli/
├── usage.jsonl        # API call log
├── chat_history.jsonl # Chat conversations
└── pricing.json       # Model pricing data
```

## License

MIT — see [LICENSE](LICENSE).
