return {
  {
    "techwizrd/render-latex.nvim",
    ft = "markdown",
    -- options live in config/options.lua as vim.g.render_latex
    opts = function()
      return vim.g.render_latex or {}
    end,
  },

  -- let render-latex own math; render-markdown keeps the rest of the markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = { latex = { enabled = false } },
  },
}
