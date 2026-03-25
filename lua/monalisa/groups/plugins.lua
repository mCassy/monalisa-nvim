local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get plugin highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent
  local italic = config.italics

  local bg = transparent and p.none or p.bg

  return {
    -- FzfLua
    FzfLuaNormal = { link = "Normal" },
    FzfLuaCursor = { link = "Cursor" },
    FzfLuaSearch = { link = "IncSearch" },
    FzfLuaCursorLineNr = { link = "CursorLineNr" },
    FzfLuaScrollFloatEmpty = { link = "PmenuSbar" },
    FzfLuaScrollFloatFull = { link = "PmenuThumb" },
    FzfLuaCursorLine = { link = "CursorLine" },
    FzfLuaBorder = { fg = p.brightGreen },
    FzfLuaTitle = { fg = p.teal },

    -- GitSigns
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.punc },
    GitSignsDelete = { fg = p.darkOrange },
    GitSignsChangedelete = { fg = p.darkOrange },
    GitSignsTopdelete = { fg = p.darkOrange },
    GitSignsUntracked = { fg = p.cmt },
    GitSignsCurrentLineBlame = { fg = p.cmt, italic = italic },

    -- Indent Blankline
    IblIndent = { fg = p.indentScope, nocombine = true },
    IblScope = { fg = p.teal, nocombine = true },
    IblWhitespace = { fg = p.indentScope, nocombine = true },

    -- Mini.nvim
    MiniTablineCurrent = { link = "TabLineSel" },
    MiniTablineHidden = { bg = p.lightBlack },
    MiniTablineVisible = { link = "MiniTablineHidden" },
    MiniTablineModifiedCurrent = { bg = p.blueGreen, bold = true },
    MiniTablineModifiedHidden = { bg = p.lightBlack, fg = p.darkYellow },
    MiniTablineModifiedVisible = { link = "MiniTablineModifiedHidden" },
    MiniTablineTabpageSection = { link = "IncSearch" },
    MiniJump2dSpot = { link = "TabLineSel" },

    -- Telescope
    TelescopeBorder = { fg = p.teal },
    TelescopePromptBorder = { fg = p.brightGreen },
    TelescopeResultsBorder = { link = "TelescopeBorder" },
    TelescopePreviewBorder = { link = "TelescopeBorder" },
    TelescopeTitle = { fg = p.brightGreen },
    TelescopePromptTitle = { link = "TelescopeTitle" },
    TelescopeResultsTitle = { link = "TelescopeTitle" },
    TelescopePreviewTitle = { link = "TelescopeTitle" },
    TelescopeNormal = { bg = transparent and p.none or nil },
    TelescopeSelection = { link = "Visual" },
    TelescopeSelectionCaret = { fg = p.fg, bg = p.brightGreen },
    TelescopeMatching = { link = "Special" },
    TelescopePromptCounter = { link = "TelescopeBorder" },
    TelescopePromptPrefix = { link = "TelescopeTitle" },
    TelescopePreviewLine = { link = "TelescopeSelection" },

    -- Lazy.nvim
    LazyNormal = { bg = transparent and p.none or p.lightBlack },
    LazyButton = { bg = p.bg },
    LazyButtonActive = { fg = p.bg, bg = p.brightGreen },
    LazyH1 = { fg = p.brightGreen, bg = p.bg },
    LazyH2 = { fg = p.brightGreen, bg = p.bg },
    LazySpecial = { fg = p.darkYellow },

    -- Mason
    MasonNormal = { bg = transparent and p.none or p.lightBlack },
    MasonHeader = { fg = p.fg, bg = p.lightBlack },
    MasonHighlight = { fg = p.brightGreen, bg = p.bg },
    MasonHighlightBlock = { link = "LazyButtonActive" },
    MasonHighlightBlockBold = { link = "LazyButtonActive" },
    MasonHeaderSecondary = { link = "LazyButtonActive" },
    MasonMuted = { fg = p.darkYellow, bg = p.lightBlack },
    MasonMutedBlock = { link = "MasonMuted" },
    MasonMutedBlockBold = { link = "MasonHighlight" },

    -- Which-key
    WhichKey = { fg = p.fg },
    WhichKeyBorder = { fg = p.teal },
    WhichKeyDesc = { fg = p.green },
    WhichKeyFloat = { bg = transparent and p.none or p.lightBlack },
    WhichKeyGroup = { fg = p.brightGreen },
    WhichKeySeparator = { fg = p.darkYellow },
    WhichKeyValue = { fg = p.darkYellow },

    -- Neo-tree
    NeoTreeNormal = { bg = transparent and p.none or nil },
    NeoTreeNormalNC = { bg = transparent and p.none or nil },
    NeoTreeEndOfBuffer = { bg = transparent and p.none or nil },
    NeoTreeSignColumn = { bg = transparent and p.none or nil },
    NeoTreeFloatBorder = { fg = p.teal, bg = transparent and p.none or nil },
    NeoTreeFloatNormal = { bg = transparent and p.none or nil },
    NeoTreeFloatTitle = { fg = p.brightGreen, bg = transparent and p.none or nil },
    NeoTreeTitleBar = { fg = p.brightGreen, bg = transparent and p.none or nil },
    NeoTreeCursorLine = { bg = transparent and p.none or p.lightBlack },
    NeoTreeDirectoryName = { fg = p.brightGreen },
    NeoTreeDirectoryIcon = { fg = p.brightGreen },
    NeoTreeFileName = { fg = p.fg },
    NeoTreeFileIcon = { fg = p.fg },
    NeoTreeGitAdded = { fg = p.green },
    NeoTreeGitConflict = { fg = p.orange, bold = true },
    NeoTreeGitDeleted = { fg = p.darkOrange },
    NeoTreeGitIgnored = { fg = p.cmt },
    NeoTreeGitModified = { fg = p.punc },
    NeoTreeGitRenamed = { fg = p.brightGreen },
    NeoTreeGitStaged = { fg = p.green },
    NeoTreeGitUnstaged = { fg = p.punc },
    NeoTreeGitUntracked = { fg = p.cmt },

    -- Trouble.nvim
    TroubleNormal = { bg = transparent and p.none or p.lightBlack },
    TroubleText = { link = "Normal" },
    TroublePreview = { link = "Visual" },
    TroubleSource = { link = "Comment" },
    TroubleCode = { link = "Special" },
    TroublePos = { link = "LineNr" },
    TroubleCount = { fg = p.bg, bg = p.brightGreen, bold = true },
    TroubleFilename = { link = "Directory" },
    TroubleIndent = { link = "LineNr" },
    TroubleIndentFoldClosed = { link = "CursorLineNr" },

    -- flash.nvim
    FlashBackdrop = { fg = p.cmt },
    FlashMatch = { link = "Search" },
    FlashCurrent = { link = "IncSearch" },
    FlashLabel = { fg = p.bg, bg = p.orange, bold = true },
    FlashCursor = { link = "Cursor" },

    -- Blink.cmp
    BlinkCmpMenu = { bg = transparent and p.none or nil },
    BlinkCmpMenuBorder = { bg = transparent and p.none or nil },
    BlinkCmpDoc = { bg = transparent and p.none or nil },
    BlinkCmpDocBorder = { bg = transparent and p.none or nil },
    BlinkCmpSignatureHelp = { bg = transparent and p.none or nil },
    BlinkCmpSignatureHelpBorder = { bg = transparent and p.none or nil },
    BlinkCmpMenuSelection = { fg = p.bg, bg = p.brightGreen },

    -- Noice
    NoiceCmdlinePopup = { bg = transparent and p.none or nil },
    NoiceCmdlinePopupBorder = { fg = p.teal, bg = transparent and p.none or nil },
    NoiceCmdlinePopupTitle = { fg = p.brightGreen, bg = transparent and p.none or nil },

    -- snacks.nvim
    SnacksDashboardNormal = { bg = bg },
    SnacksDashboardHeader = { fg = p.green },
    SnacksDashboardIcon = { fg = p.brightGreen },
    SnacksDashboardKey = { fg = p.orange, bold = true },
    SnacksDashboardDesc = { fg = p.fg },
    SnacksDashboardFooter = { fg = p.cmt },
    SnacksNotifierInfo = { link = "NormalFloat" },
    SnacksNotifierWarn = { link = "NormalFloat" },
    SnacksNotifierError = { link = "NormalFloat" },
    SnacksNotifierIconInfo = { link = "DiagnosticSignInfo" },
    SnacksNotifierIconWarn = { link = "DiagnosticSignWarn" },
    SnacksNotifierIconError = { link = "DiagnosticSignError" },
    SnacksNotifierBorderInfo = { link = "DiagnosticInfo" },
    SnacksNotifierBorderWarn = { link = "DiagnosticWarn" },
    SnacksNotifierBorderError = { link = "DiagnosticError" },
    SnacksNotifierTitleInfo = { link = "DiagnosticInfo" },
    SnacksNotifierTitleWarn = { link = "DiagnosticWarn" },
    SnacksNotifierTitleError = { link = "DiagnosticError" },
    SnacksIndent = { fg = p.indentScope },
    SnacksIndentScope = { fg = p.teal },
    SnacksPickerMatch = { link = "Special" },
    SnacksPickerPrompt = { fg = p.brightGreen },
    SnacksPickerDir = { link = "NonText" },
    SnacksPickerFile = { link = "Normal" },
    SnacksPickerDirectory = { link = "Directory" },
    SnacksInputIcon = { fg = p.brightGreen },
    SnacksInputBorder = { fg = p.teal },
    SnacksInputTitle = { fg = p.brightGreen },
    SnacksDim = { fg = p.cmt },
  }
end

return { get = get }
