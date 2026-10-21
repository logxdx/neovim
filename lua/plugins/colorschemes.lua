-- Extra colorschemes: installed, but only loaded on `:colorscheme <name>`.
-- tokyonight (the default) and catppuccin already come with LazyVim.
return {
  { "ribru17/bamboo.nvim", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "kepano/flexoki-neovim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "tahayvr/matteblack.nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },

  -- to change the startup colorscheme:
  -- { "LazyVim/LazyVim", opts = { colorscheme = "kanagawa" } },
}
