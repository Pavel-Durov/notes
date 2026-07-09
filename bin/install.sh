#!/bin/sh
set -eu

DIR=$(cd "$(dirname "$0")" && pwd)
BIN="${HOME}/.local/bin"
ZSHRC="${HOME}/.zshrc"
MARK="# >>> notes shell integration >>>"

command -v fzf >/dev/null || { echo "notes needs fzf on PATH." >&2; exit 1; }

mkdir -p "$BIN"
ln -sf "$DIR/notes" "$BIN/notes"

touch "$ZSHRC"
if ! grep -qF "$MARK" "$ZSHRC"; then
    {
        printf '\n%s\n' "$MARK"
        printf 'export PATH="$HOME/.local/bin:$PATH"\n'
        printf 'source <(notes --zsh)\n'
        printf '# <<< notes shell integration <<<\n'
    } >> "$ZSHRC"
fi

echo "installed. open a new shell or: source ~/.zshrc"
