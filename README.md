# nvim

[LazyVim](https://www.lazyvim.org/)-based config.

```
init.lua                  entry point
lua/config/
  lazy.lua                lazy.nvim bootstrap + setup
  options.lua             overrides of LazyVim's default options
  keymaps.lua             extra keymaps (loaded on VeryLazy)
  autocmds.lua            extra autocmds (loaded on VeryLazy)
  transparency.lua        clears theme backgrounds, re-applied on :colorscheme
lua/plugins/
  colorschemes.lua        extra themes, loaded on demand
  python.lua              ruff formatting, ty LSP settings
  ui.lua                  news popup + scroll animation off
lazyvim.json              enabled LazyVim extras (managed via :LazyExtras)
```
