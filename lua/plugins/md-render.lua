return {
  -- render-markdown draws $...$ and $$...$$ math as unicode text via utftex
  -- (d_{in} -> dᵢₙ). utftex comes from libtexprintf, built into ~/.local/bin.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      latex = {
        enabled = true,
        converter = "utftex",
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
