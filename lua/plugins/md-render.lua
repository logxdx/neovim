return {
  -- render-markdown draws $...$ and $$...$$ math as unicode text via utftex
  -- (d_{in} -> dᵢₙ). utftex comes from libtexprintf, built into ~/.local/bin.
  -- bin/utftex-inline wraps it so scripts without a unicode form stay on one line
  -- (f_y, not "y" with f on a virtual line above); plain utftex is the fallback.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      latex = {
        enabled = true,
        converter = { vim.fn.stdpath("config") .. "/bin/utftex-inline", "utftex" },
        inline = true,
        block = true,
      },
    },
  },

  -- render-markdown finds math with the latex parser (tree-sitter CLI needed to generate it)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "latex" } },
  },
}
