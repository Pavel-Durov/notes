# notes

Fzf-based browser for a local notes directory.

## Requirements

- `fzf`
- `$EDITOR` (defaults to `nvim`)

## Install

```sh
git clone <repo-url> ~/src/notes
sh ~/src/notes/install.sh
```

The installer symlinks `notes` into `~/.local/bin` and appends a guarded
block to `~/.zshrc` that sources the shell integration.

Open a new shell (or `source ~/.zshrc`). **Ctrl-W** launches the picker.

## Usage

| Command | Behaviour |
|---|---|
| `notes` | fuzzy-search path and content across all notes, enter opens at the matched line |
| `notes -c [query]` | live grep, re-runs on each keystroke |
| `notes new <name>` | create or open a note |
| `notes --zsh` | print the zsh shell integration |
| `notes -h` | help |

## Configuration

| Variable | Default | Purpose |
|---|---|---|
| `NOTES_DIR` | `~/.notes` | directory to browse; created on first use |
| `EDITOR` | `nvim` | editor invoked on selection |

Set `NOTES_DIR` in your shell rc to point elsewhere:

```sh
export NOTES_DIR="$HOME/work/notes"
```

## Key binding

The zsh integration binds **Ctrl-W** to launch `notes`, overriding
`backward-kill-word`. To rebind, replace the `bindkey` line emitted by
`notes --zsh` (for example `'^[n'` for Alt-N).

## License

MIT.
