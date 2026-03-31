local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get syntax highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local italic = config.italics

  return {
    -- Standard syntax groups
    Comment = { fg = p.cmt, italic = italic },
    Constant = { fg = p.crimson },
    String = { fg = p.darkYellow },
    Character = { fg = p.darkYellow },
    Number = { fg = p.crimson },
    Boolean = { link = "Constant" },
    Float = { fg = p.crimson },

    Identifier = { fg = p.fg },
    Function = { fg = p.green },
    Field = { fg = p.teal },

    Statement = { fg = p.brightGreen },
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Operator = { fg = p.blueGreen },
    Keyword = { fg = p.brightGreen },
    Exception = { link = "Statement" },

    PreProc = { fg = p.blueGreen },
    Include = { fg = p.blueGreen },
    Define = { fg = p.blueGreen },
    Macro = { fg = p.blueGreen },
    PreCondit = { fg = p.blueGreen },

    Type = { fg = p.darkOrange },
    StorageClass = { fg = p.darkOrange },
    Structure = { link = "Type" },
    Typedef = { fg = p.darkOrange },

    Special = { fg = p.darkOrange },
    SpecialChar = { fg = p.darkOrange },
    Tag = { fg = p.darkOrange },
    Delimiter = { fg = p.punc },
    DelimiterLight = { fg = p.altfg },
    SpecialComment = { link = "Comment" },
    Debug = { link = "Special" },

    Underlined = { fg = p.green, underline = true },
    Ignore = { link = "Comment" },
    Error = { fg = p.crimson },
    Todo = { fg = p.darkYellow },

    -- Markdown
    markdownBold = { bold = true },
    markdownItalic = { italic = italic },
    markdownCodeBlock = { link = "String" },
    markdownCodeDelimiter = { link = "NonText" },
    markdownHeadingRule = { link = "NonText" },
    markdownLinkDelimiter = { link = "Delimiter" },
    markdownURLDelimiter = { link = "Delimiter" },

    -- HTML
    htmlTag = { fg = p.green },
    htmlEndTag = { link = "htmlTag" },
    htmlTagName = { fg = p.green },
    htmlArg = { fg = p.green },
    htmlLink = { link = "Underlined" },
    htmlBold = { bold = true },
    htmlItalic = { italic = italic },
    htmlUnderline = { underline = true },
    htmlBoldItalic = { bold = true, italic = italic },
    htmlBoldUnderline = { bold = true, underline = true },
    htmlUnderlineItalic = { underline = true, italic = italic },
    htmlBoldUnderlineItalic = { bold = true, underline = true, italic = italic },
    htmlH1 = { bold = true },

    -- XML
    xmlTag = { fg = p.darkOrange },
    xmlEndTag = { link = "xmlTag" },
    xmlTagName = { fg = p.darkOrange },
    xmlAttrib = { link = "xmlTag" },
    xmlEqual = { link = "xmlTag" },
    xmlString = { link = "xmlTagName" },

    -- Git commit
    gitCommitBranch = { fg = p.orange },
    gitCommitSelectedFile = { fg = p.green },
    gitCommitSelectedType = { fg = p.green },
    gitCommitUnmergedFile = { fg = p.crimson },
    gitCommitUnmergedType = { fg = p.crimson },
    gitCommitDiscardedFile = { link = "gitCommitUnmergedFile" },
    gitCommitDiscardedType = { link = "gitCommitUnmergedType" },
    gitCommitUntrackedFile = { link = "gitCommitUnmergedFile" },
    gitCommitFile = { link = "Directory" },

    -- Help
    helpExample = { link = "String" },
    helpHeadline = { link = "Title" },
    helpHyperTextEntry = { link = "Statement" },
    helpHyperTextJump = { link = "Underlined" },
    helpSectionDelim = { link = "Comment" },
    helpURL = { link = "Underlined" },
  }
end

return { get = get }
