#!/bin/bash
# Notify skill - send macOS notifications for Claude Code events

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/claude-notifier.sh" "$@"
