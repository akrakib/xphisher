#!/bin/bash

# Compatibility launcher for the original README command: bash zphisher.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "$SCRIPT_DIR/xphisher.sh" ]]; then
    bash "$SCRIPT_DIR/xphisher.sh" "$@"
else
    echo "Launcher not found."
    exit 1
fi
