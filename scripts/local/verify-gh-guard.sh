#!/usr/bin/env bash
set -euo pipefail

WRAPPER_PATH="${HOME}/.local/bin/gh"

if [[ ! -x "$WRAPPER_PATH" ]]; then
	echo "Missing wrapper: $WRAPPER_PATH" >&2
	exit 1
fi

if ! grep -Fq '" $* " == *" pr merge "*' "$WRAPPER_PATH"; then
	echo "Wrapper found but merge guard pattern missing." >&2
	exit 1
fi

echo "gh safeguard is installed at $WRAPPER_PATH"
