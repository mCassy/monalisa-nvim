local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get editor highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent

  local bg = transparent and p.none or p.bg

  return {
    -- Core editor
    Normal = { fg = p.fg, bg = bg },
    NormalNC = { fg = p.fg, bg = bg },
    NormalFloat = { fg = p.fg, bg = bg },
    FloatBorder = { fg = p.teal, bg = bg },
    FloatTitle = { fg = p.brightGreen },
    Title = { fg = p.blueGreen },

    -- Cursor
    Cursor = { fg = p.bg, bg = p.fg },
    lCursor = { fg = p.bg, bg = p.fg },
    CursorLine = { bg = bg },
    CursorColumn = { bg = bg },
    CursorLineNr = { fg = p.green },
    TermCursor = { link = "Cursor" },

    -- Line numbers & columns
    LineNr = { fg = p.green },
    LineNrAbove = { fg = p.cmt },
    LineNrBelow = { fg = p.cmt },
    SignColumn = { fg = p.cmt, bg = bg },
    FoldColumn = { fg = p.cmt, bg = bg },
    ColorColumn = { bg = p.bg },
    CursorLineFold = { link = "FoldColumn" },
    CursorLineSign = { link = "SignColumn" },

    -- Splits & separators
    VertSplit = { fg = p.lightBlack, bg = p.bg },
    WinSeparator = { link = "VertSplit" },

    -- Status line
    StatusLine = { bg = p.lightBlack },
    StatusLineNC = { link = "StatusLine" },
    WinBar = { bg = transparent and p.none or nil, bold = true },
    WinBarNC = { link = "WinBar" },
    MsgSeparator = { link = "StatusLine" },

    -- Tab line
    TabLine = { bg = p.selection },
    TabLineSel = { bg = p.green, bold = true },
    TabLineSep = { fg = p.selection, bg = p.bg },
    TabLineSelSep = { fg = p.green, bold = true, bg = p.bg },
    TabLineFill = { fg = p.fg, bg = p.bg },

    -- Popup menu
    Pmenu = { link = "Normal" },
    PmenuSel = { fg = p.fg, bg = p.brightGreen },
    PmenuSbar = { link = "Normal" },
    PmenuThumb = { link = "Normal" },
    PmenuKind = { link = "Pmenu" },
    PmenuKindSel = { link = "PmenuSel" },
    PmenuExtra = { link = "Pmenu" },
    PmenuExtraSel = { link = "Pmenu" },

    -- Wildmenu
    WildMenu = { fg = "black", bg = p.darkYellow },

    -- Search & matches
    Search = { fg = p.fg, bg = p.crimson },
    CurSearch = { fg = p.fg, bg = p.green },
    IncSearch = { fg = p.fg, bg = p.darkYellow },
    Substitute = { link = "IncSearch" },
    MatchParen = { link = "Normal" },

    -- Visual mode
    Visual = { bg = p.selection },
    VisualNOS = { link = "Visual" },

    -- Folding
    Folded = { fg = p.orange, bg = p.lightBlack },

    -- Messages
    ModeMsg = { link = "Normal" },
    MoreMsg = { fg = p.blue, bold = true },
    Question = { link = "Field" },
    ErrorMsg = { fg = p.darkOrange },
    WarningMsg = { fg = p.orange },

    -- Misc UI
    NonText = { link = "Comment" },
    EndOfBuffer = { link = "Comment" },
    SpecialKey = { fg = p.fg },
    Conceal = { link = "Comment" },
    Directory = { fg = p.green },
    QuickFixLine = { link = "Search" },
    Whitespace = { link = "NonText" },

    -- Diff
    DiffText = { link = "Visual" },
    DiffAdd = { fg = p.brightGreen },
    DiffAdded = { link = "DiffAdd" },
    Added = { link = "DiffAdd" },
    DiffChange = { fg = p.punc },
    DiffChanged = { link = "DiffChange" },
    Changed = { link = "DiffChange" },
    DiffDelete = { fg = p.crimson },
    DiffRemoved = { link = "DiffDelete" },
    Removed = { link = "DiffDelete" },

    -- Spell
    SpellBad = { fg = p.crimson, sp = p.fg, underline = true },
    SpellCap = { fg = p.green, sp = p.fg, underline = true },
    SpellLocal = { fg = p.orange, sp = p.fg, underline = true },
    SpellRare = { fg = p.darkOrange, sp = p.fg, underline = true },
  }
end

return { get = get }
