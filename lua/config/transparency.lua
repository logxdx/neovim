-- Clear backgrounds so the terminal shows through. Foreground colors are kept.
-- VimEnter covers the startup theme (LazyVim's default loads tokyonight without firing
-- ColorScheme); ColorScheme covers later `:colorscheme` switches.
local groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "Pmenu",
  "Terminal",
  "EndOfBuffer",
  "FoldColumn",
  "Folded",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "WhichKeyFloat",
}

local function apply()
  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg = nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = vim.api.nvim_create_augroup("transparency", { clear = true }),
  callback = apply,
})
