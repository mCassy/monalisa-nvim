---@class MonalisaPalette
---@field none string
---@field bg string
---@field fg string
---@field altfg string
---@field red string
---@field green string
---@field blue string
---@field crimson string
---@field orange string
---@field teal string
---@field brightGreen string
---@field darkOrange string
---@field blueGreen string
---@field darkYellow string
---@field brightBlue string
---@field cmt string
---@field punc string
---@field selection string
---@field lightBlack string
---@field indentScope string

---@type MonalisaPalette
local palette = {
  none = "NONE",

  -- backgrounds
  bg = "#120b0d",
  selection = "#2F2327",
  lightBlack = "#362127",
  indentScope = "#151E15",

  -- foreground
  fg = "#f6d666",
  altfg = "#a18954",

  -- main colors
  red = "#ca5443",
  green = "#636135",
  blue = "#525c5d",
  crimson = "#9e333f",
  orange = "#c16e31",
  teal = "#476746",
  brightGreen = "#928f4e",
  darkOrange = "#9a5727",
  blueGreen = "#5D6C5A",
  darkYellow = "#bb8a3e",
  brightBlue = "#9eb2b4",

  -- special colors
  cmt = "#514743",
  punc = "#6a5f3f",
}

return palette
