-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- basics
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line

-- tabbing & indentation
vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4 -- soft tab stop
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from previous line
vim.opt.grepprg = "rg --vimgrep" -- use ripgrep instead of grep
vim.opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- visual settings
vim.opt.termguicolors = true
vim.opt.showmatch = true

-- python LSP: ty (astral, rust) instead of pyright. must be set before plugins load.
vim.g.lazyvim_python_lsp = "ty"

-- render-latex.nvim (lua/plugins/md-render.lua passes this table to setup()).
-- values below are the plugin defaults; tweak in place. see :help render-latex
vim.g.render_latex = {
  enabled = true,
  debounce = 75, -- ms to wait after edits before re-rendering
  file_types = { "markdown" },
  render_modes = { "n", "i" }, -- modes in which equations show as images
  prefetch_lines = 40, -- render this many lines beyond the viewport
  conceal = true,
  max_file_lines = 5000, -- skip rendering in files longer than this
  install = {
    auto = true, -- download the prebuilt worker on first load
    version = "latest", -- or a tag like "v0.1.0", or "unreleased"
  },
  render = {
    preset = "match_text", -- "match_text" | "compact" | "presentation"
    -- foreground = "#c0caf5", -- fixed equation color (default: follows text color)
    match_text_color = true,
    background = "transparent",
    match_text_size = true,
    font_size = 34,
    text_scale = 1.0,
    scale = 1.5,
    padding = 10,
    placeholder = true, -- show a placeholder while an equation renders
    equation_labels = "right", -- "right" | "sign" | "both" | false
    equation_label_format = "Eq. %d",
    inline = "conceal", -- inline $...$: "conceal" | "content" | "highlight" | false
    inline_symbols = true, -- turn \alpha etc. into unicode symbols inline
    live_preview = true, -- preview the equation under the cursor while editing
    hide_on_cmdline = false,
    exit_delay_ms = 150,
  },
  image = {
    backend = "auto", -- "auto" | "nvim" | "kitty"
    zindex = 60,
  },
}
