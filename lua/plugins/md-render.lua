-- render-latex's math engine glues \tag onto the equation ("f = 0(2.1)", \tag*{A} -> "hA")
-- and rejects \label, so rewrite them before formulas reach its worker: tags move to the
-- right as (2.1) / A, and the non-visual \label{...}, \notag, \nonumber are dropped.
local function untag(formula)
  local function group_end(s, i) -- s[i] is "{"; index of its matching "}"
    local depth = 0
    while i <= #s do
      local c = s:sub(i, i)
      if c == "\\" then
        i = i + 1
      elseif c == "{" then
        depth = depth + 1
      elseif c == "}" then
        depth = depth - 1
        if depth == 0 then
          return i
        end
      end
      i = i + 1
    end
  end

  local out, tags, i = {}, {}, 1
  while i <= #formula do
    local s, e, name, star = formula:find("^\\(%a+)(%*?)", i)
    local open = s and formula:find("%S", e + 1)
    local close = open and formula:sub(open, open) == "{" and group_end(formula, open)
    if s and (name == "notag" or name == "nonumber") then
      i = e + 1
    elseif s and close and (name == "tag" or (name == "label" and star == "")) then
      if name == "tag" then
        local arg = formula:sub(open + 1, close - 1)
        tags[#tags + 1] = [[\qquad\text{]] .. (star == "*" and arg or "(" .. arg .. ")") .. "}"
      end
      i = close + 1
    elseif s then
      out[#out + 1] = formula:sub(s, e)
      i = e + 1
    else
      -- copy one char, or a whole \x escape so \{ and \} don't count as braces
      local n = formula:sub(i, i) == "\\" and 2 or 1
      out[#out + 1] = formula:sub(i, i + n - 1)
      i = i + n
    end
  end
  return vim.trim(table.concat(out)) .. table.concat(tags)
end

return {
  -- display math ($$...$$, \[...\]) renders as typeset images via render-latex
  -- (kitty graphics). its inline mode only conceals/swaps symbols, so it's off.
  {
    "techwizrd/render-latex.nvim",
    ft = "markdown",
    opts = {
      render = {
        inline = false,
        -- no auto "Eq. N" beside every block; like Obsidian, only \tag numbers one
        equation_labels = false,
      },
    },
    config = function(_, opts)
      require("render_latex").setup(opts)
      local Worker = require("render_latex.worker")
      local request_batch = Worker.request_batch
      Worker.request_batch = function(items, callback)
        for _, item in ipairs(items) do
          item.formula = untag(item.formula)
        end
        return request_batch(items, callback)
      end
    end,
  },

  -- inline $...$ math renders as unicode text via utftex (d_{in} -> dᵢₙ).
  -- utftex comes from libtexprintf, built into ~/.local/bin.
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
        block = false,
      },
    },
  },

  -- render-markdown finds math with the latex parser (tree-sitter CLI needed to generate it)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "latex" } },
  },
}
