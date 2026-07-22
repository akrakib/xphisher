#!/bin/bash

# Compatibility launcher for xphisher
# This script delegates to the main entry point if present, otherwise exits with guidance.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "$SCRIPT_DIR/scripts/launch.sh" ]]; then
    bash "$SCRIPT_DIR/scripts/launch.sh" "$@"
else
    echo "Unable to find launcher script."
    exit 1
fi
