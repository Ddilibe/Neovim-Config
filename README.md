# Mangino Neovim Configuration

This is a personal Neovim configuration for a productive, minimal, and well-documented editing setup.

It uses Lua for configuration and the `lazy.nvim` plugin manager (lockfile present: `lazy-lock.json`). The configuration is split into small modules under `lua/` so you can quickly find and tweak settings, mappings, themes, and plugins.

## Quick start — install

1. Backup your existing Neovim config (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s) 2>/dev/null || true
```

2. Clone this repo into your Neovim config folder:

```bash
git clone --depth=1 <this-repo-url> ~/.config/nvim
```

Replace `<this-repo-url>` with the URL of this repository (or copy the files into `~/.config/nvim`).

3. Start Neovim. On first start the `lazy.nvim` plugin manager will install plugins automatically. You can also run plugin install headlessly:

```bash
nvim --headless -c "require('lazy').sync()" -c q
```

If you want to update plugins later:

```bash
nvim --headless -c "require('lazy').update()" -c q
```

Or inside Neovim run the `:Lazy` command (if available) to interactively install/update.

## Prerequisites

- Neovim (recommended >= 0.9; newer is better). Check with `nvim --version`.
- Git (for cloning the config and some plugins that use git).
- Optional but recommended: ripgrep (`rg`), fd, nodejs (for some LSP / treesitter / null-ls integrations), Python 3 and pip (for pynvim), a C compiler for building native tree-sitter parsers.

On Debian/Ubuntu you can install the common extras:

```bash
sudo apt install ripgrep fd-find nodejs python3-pip build-essential
python3 -m pip install --user pynvim
```

## Repo layout

- `init.lua` — main entry (loads `lua/` modules).
- `lazy-lock.json` — lockfile for `lazy.nvim` (pins plugin versions).
- `lua/` — main configuration in small modules:
	- `config/` — core options, mappings, autocmds, saved theme, theme setup
		- `autocmd.lua`, `mangino.lua`, `mappings.lua`, `options.lua`, `saved_theme`, `theme.lua`
	- `plugins/` — per-plugin configuration files (see list below)
		- `autopairs.lua`, `catppuccin.lua`, `colorizer.lua`, `comments.lua`, `fterm.lua`, `fzf.lua`, `gitsigns.lua`, `gruvbox.lua`, `lazy.lua`, `nvim-tree.lua`, `treesitter.lua`

This split keeps each concern isolated and easy to modify.

## Plugins (high level)

Plugin configuration is located under `lua/plugins`. Notable plugins configured here include:

- autopairs — automatic bracket/quote pairing
- catppuccin / gruvbox — color themes (switch in `lua/config/theme.lua`)
- colorizer — inline color preview
- comments — commenting helpers
- fterm — floating terminal
- fzf — fuzzy finder integration
- gitsigns — git change indicators in the gutter
- nvim-tree — file explorer
- treesitter — improved syntax parsing and highlighting

Open `lua/plugins/*.lua` to see exact plugin specifications and options.

## Customization

- Options: edit `lua/config/options.lua` to change editor behavior (tabs, indents, line numbers, etc.).
- Mappings: edit `lua/config/mappings.lua` to change or add keybindings.
- Theme: edit or choose theme in `lua/config/theme.lua`. There are `catppuccin` and `gruvbox` configs included — set your preferred theme there.
- Plugins: add plugin specs in `lua/plugins/lazy.lua` (that's where `lazy.nvim` is configured). When you change plugin specs, run `nvim --headless -c "require('lazy').sync()" -c q` to let `lazy` install/update plugins and regenerate the lockfile.

If you add a new Lua module, require it from `init.lua` or the appropriate loader file.

## Tips & troubleshooting

- Long first run: the first time you start Neovim this config will download and build plugins. Be patient — it can take several minutes depending on network and build steps.
- Tree-sitter build failures: ensure you have a working C toolchain (gcc/clang, make) and internet access.
- Python LSP / pynvim errors: make sure `pynvim` is installed in the Python used by Neovim: `python3 -m pip install --user pynvim`.
- If something breaks after a change, you can revert to your backup or the previous commit. To test changes incrementally, open Neovim and source a single file with `:luafile %` when editing a Lua module.

## Updating this config

1. Pull new changes in the repository:

```bash
cd ~/.config/nvim
git pull --rebase
```

2. Update plugins:

```bash
nvim --headless -c "require('lazy').update()" -c q
```

If you want to regenerate or update the lockfile, use the `lazy` API or the commands in the plugin manager; check `lua/plugins/lazy.lua` for the exact setup in this repo.

## Contributing / Extending

- Prefer small, focused modules under `lua/`.
- Keep mappings and plugin-specific configs grouped logically so future edits are easy to find.

## Credits

This configuration builds on the wider Neovim and Lua community. Plugins managed by `lazy.nvim` are maintained by their respective authors — see `lua/plugins` for the plugin list.

## License

This config does not include an explicit license file. If you intend to publish or share it publicly, consider adding a `LICENSE` (MIT, Apache-2.0, etc.).


