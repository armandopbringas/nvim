# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Notes setup

This config adds a minimal Markdown notes workflow under `~/notes`.

- `:NotesFind` searches note content with Telescope `live_grep`.
- `:NotesFiles` searches note files with Telescope `find_files`.
- `:NotesToday` opens or creates `~/notes/YYYY-MM-DD_daily.md`.
- `:NotesInbox` appends a timestamped line into `~/notes/inbox/YYYY-MM-DD_inbox.md`.
- Markdown buffers use Treesitter folding by heading/section.
- `<leader>nt` toggles the current section fold.
- `<leader>nO` opens all Markdown sections.
- `<leader>nC` closes all Markdown sections.

`rg` (ripgrep) is required for `:NotesFind`.
