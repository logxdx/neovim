-- Python toolchain: ty (type checker + LSP) and ruff (linter + formatter), both Rust.
-- The LSP swap itself lives in config/options.lua (vim.g.lazyvim_python_lsp = "ty"),
-- since LazyVim's python extra reads that at spec-load time.

return {
  -- ruff handles formatting and import sorting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },

  -- let ty own hover/definition; ruff stays the linter + code-action source
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {
          settings = {
            ty = {
              experimental = { rename = true },
            },
          },
        },
      },
    },
  },
}
