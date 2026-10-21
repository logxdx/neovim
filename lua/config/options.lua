-- Loaded before lazy.nvim starts. Only overrides of LazyVim's defaults belong here:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- 4-space indentation (LazyVim defaults to 2)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.showmatch = true -- briefly jump to the matching bracket

-- Python LSP: ty instead of pyright. LazyVim's python extra reads this at spec-load
-- time, so it has to live here rather than in lua/plugins/python.lua.
vim.g.lazyvim_python_lsp = "ty"
