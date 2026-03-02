#!/usr/bin/env bash
set -euo pipefail

LOCAL_BIN="${HOME}/.local/bin"
WRAPPER_PATH="${LOCAL_BIN}/gh"
PATH_LINE='export PATH="$HOME/.local/bin:$PATH"'

find_real_gh() {
	if [[ -n "${REAL_GH_PATH:-}" ]]; then
		printf '%s\n' "$REAL_GH_PATH"
		return 0
	fi

	if ! command -v gh >/dev/null 2>&1; then
		return 1
	fi

	while IFS= read -r candidate; do
		if [[ "$candidate" != "$WRAPPER_PATH" ]]; then
			printf '%s\n' "$candidate"
			return 0
		fi
	done < <(which -a gh 2>/dev/null || true)

	return 1
}

REAL_GH="$(find_real_gh || true)"

if [[ -z "$REAL_GH" || ! -x "$REAL_GH" ]]; then
	echo "Error: could not find a real gh binary. Install GitHub CLI first or set REAL_GH_PATH." >&2
	exit 1
fi

mkdir -p "$LOCAL_BIN"

cat > "$WRAPPER_PATH" <<WRAPPER
#!/usr/bin/env bash
set -euo pipefail

if [[ " \$* " == *" pr merge "* ]]; then
	echo "Blocked: merging requires human approval"
	exit 1
fi

exec "$REAL_GH" "\$@"
WRAPPER

chmod +x "$WRAPPER_PATH"

for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
	touch "$rc"
	if ! grep -Fq "$PATH_LINE" "$rc"; then
		echo "$PATH_LINE" >> "$rc"
	fi
done

echo "Installed gh safeguard wrapper at: $WRAPPER_PATH"
echo "Real gh binary: $REAL_GH"
echo "Reload shell: source ~/.zshrc"
echo "Verify with: gh pr merge 123"
