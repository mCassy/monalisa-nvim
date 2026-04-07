-- Lualine theme for MonaLisa

local p = require("monalisa.palette")

return {
  normal = {
    a = { fg = p.bg, bg = p.green, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  insert = {
    a = { fg = p.bg, bg = p.brightGreen, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  visual = {
    a = { fg = p.bg, bg = p.orange, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  replace = {
    a = { fg = p.bg, bg = p.crimson, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  command = {
    a = { fg = p.bg, bg = p.darkYellow, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  terminal = {
    a = { fg = p.bg, bg = p.teal, gui = "bold" },
    b = { fg = p.fg, bg = p.selection },
    c = { fg = p.altfg, bg = p.lightBlack },
  },
  inactive = {
    a = { fg = p.cmt, bg = p.lightBlack },
    b = { fg = p.cmt, bg = p.lightBlack },
    c = { fg = p.cmt, bg = p.lightBlack },
  },
}
