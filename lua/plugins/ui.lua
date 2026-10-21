return {
  -- don't open LazyVim's NEWS.md after updates
  { "LazyVim/LazyVim", opts = { news = { lazyvim = false, neovim = false } } },

  -- no smooth-scroll animation
  { "folke/snacks.nvim", opts = { scroll = { enabled = false } } },
}
