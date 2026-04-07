local M = {}

---@type MonalisaConfig
M.config = require("monalisa.config")

---Setup monalisa colorscheme
---@param opts? MonalisaConfig
function M.setup(opts)
  M.config.setup(opts)
end

---Load the colorscheme
function M.load()
  -- Reset highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "monalisa"

  local config = require("monalisa.config")
  local palette = require("monalisa.palette")

  -- Set terminal colors
  if config.terminal_colors then
    M.set_terminal_colors(palette)
  end

  -- Load highlight groups
  local groups = {}

  -- Collect all highlight groups
  for _, source in ipairs({
    "monalisa.groups.editor",
    "monalisa.groups.syntax",
    "monalisa.groups.treesitter",
    "monalisa.groups.lsp",
    "monalisa.groups.plugins",
  }) do
    local ok, module = pcall(require, source)
    if ok and module.get then
      for name, hl in pairs(module.get()) do
        groups[name] = hl
      end
    end
  end

  -- Merge user overrides
  for name, overrides in pairs(config.overrides) do
    if groups[name] then
      -- Merge with existing group
      groups[name] = vim.tbl_extend("force", groups[name], overrides)
    else
      -- New group from overrides
      groups[name] = overrides
    end
  end

  -- Apply all highlight groups
  for name, hl in pairs(groups) do
    -- Filter out nil/invalid values (nvim_set_hl is strict about types)
    local clean_hl = {}
    for k, v in pairs(hl) do
      if v ~= nil then
        -- Ensure boolean fields are actually booleans
        if k == "italic" or k == "bold" or k == "underline" or k == "undercurl" 
           or k == "strikethrough" or k == "reverse" or k == "standout" 
           or k == "nocombine" or k == "underdouble" or k == "underdotted" 
           or k == "underdashed" then
          if v == true then
            clean_hl[k] = true
          end
          -- Skip if not true (don't include false or other values)
        else
          clean_hl[k] = v
        end
      end
    end
    vim.api.nvim_set_hl(0, name, clean_hl)
  end
end

---Set terminal colors (0-15)
---@param p MonalisaPalette
function M.set_terminal_colors(p)
  -- Dark colors (0-7)
  vim.g.terminal_color_0 = p.bg          -- black
  vim.g.terminal_color_1 = p.crimson     -- red
  vim.g.terminal_color_2 = p.green       -- green
  vim.g.terminal_color_3 = p.darkYellow  -- yellow
  vim.g.terminal_color_4 = p.blue        -- blue
  vim.g.terminal_color_5 = p.orange      -- magenta
  vim.g.terminal_color_6 = p.teal        -- cyan
  vim.g.terminal_color_7 = p.fg          -- white

  -- Bright colors (8-15)
  vim.g.terminal_color_8 = p.cmt         -- bright black
  vim.g.terminal_color_9 = p.red         -- bright red
  vim.g.terminal_color_10 = p.brightGreen -- bright green
  vim.g.terminal_color_11 = p.darkYellow -- bright yellow
  vim.g.terminal_color_12 = p.brightBlue -- bright blue
  vim.g.terminal_color_13 = p.darkOrange -- bright magenta
  vim.g.terminal_color_14 = p.blueGreen  -- bright cyan
  vim.g.terminal_color_15 = p.altfg      -- bright white
end

return M
