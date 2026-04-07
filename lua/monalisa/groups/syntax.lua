local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get syntax highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette

  local italic_comments = config.is_italic("comments")
  local italic_keywords = config.is_italic("keywords")
  local italic_functions = config.is_italic("functions")
  local italic_strings = config.is_italic("strings")
  local italic_variables = config.is_italic("variables")
  local italic_parameters = config.is_italic("parameters")

  return {
    -- Standard syntax groups
    Comment = { fg = p.cmt, italic = italic_comments },
    Constant = { fg = p.crimson },
    String = { fg = p.darkYellow, italic = italic_strings },
    Character = { fg = p.darkYellow },
    Number = { fg = p.crimson },
    Boolean = { link = "Constant" },
    Float = { fg = p.crimson },

    Identifier = { fg = p.fg, italic = italic_variables },
    Function = { fg = p.green, italic = italic_functions },
    Field = { fg = p.teal },

    Statement = { fg = p.brightGreen },
    Conditional = { fg = p.brightGreen, italic = italic_keywords },
    Repeat = { fg = p.brightGreen, italic = italic_keywords },
    Label = { link = "Statement" },
    Operator = { fg = p.blueGreen },
    Keyword = { fg = p.brightGreen, italic = italic_keywords },
    Exception = { fg = p.brightGreen, italic = italic_keywords },

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
    SpecialComment = { fg = p.cmt, italic = italic_comments },
    Debug = { link = "Special" },

    Underlined = { fg = p.green, underline = true },
    Ignore = { link = "Comment" },
    Error = { fg = p.crimson },
    Todo = { fg = p.darkYellow },

    -- Markdown
    markdownBold = { bold = true },
    markdownItalic = { italic = true },
    markdownCodeBlock = { link = "String" },
    markdownCodeDelimiter = { link = "NonText" },
    markdownHeadingRule = { link = "NonText" },
    markdownLinkDelimiter = { link = "Delimiter" },
    markdownURLDelimiter = { link = "Delimiter" },
    markdownUrl = { fg = p.green, italic = italic_strings, underline = true },

    -- HTML
    htmlTag = { fg = p.green },
    htmlEndTag = { link = "htmlTag" },
    htmlTagName = { fg = p.green },
    htmlArg = { fg = p.green, italic = italic_variables },
    htmlLink = { link = "Underlined" },
    htmlBold = { bold = true },
    htmlItalic = { italic = true },
    htmlUnderline = { underline = true },
    htmlBoldItalic = { bold = true, italic = true },
    htmlBoldUnderline = { bold = true, underline = true },
    htmlUnderlineItalic = { underline = true, italic = true },
    htmlBoldUnderlineItalic = { bold = true, underline = true, italic = true },
    htmlH1 = { bold = true },

    -- XML
    xmlTag = { fg = p.darkOrange },
    xmlEndTag = { link = "xmlTag" },
    xmlTagName = { fg = p.darkOrange },
    xmlAttrib = { fg = p.darkOrange, italic = italic_variables },
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

    -- PHP
    phpVarSelector = { fg = p.fg },
    phpIdentifier = { fg = p.fg },
    phpFunctions = { fg = p.green, italic = italic_functions },
    phpClasses = { fg = p.darkOrange },
    phpFunction = { fg = p.green, italic = italic_functions },
    phpClass = { fg = p.darkOrange },
    phpMethod = { fg = p.green, italic = italic_functions },
    phpMemberSelector = { fg = p.blueGreen },
    phpKeyword = { fg = p.brightGreen, italic = italic_keywords },
    phpType = { fg = p.darkOrange },
    phpInclude = { fg = p.blueGreen },
    phpDefine = { fg = p.brightGreen, italic = italic_keywords },
    phpBacktick = { fg = p.darkYellow },
    phpBoolean = { fg = p.crimson },
    phpNumber = { fg = p.crimson },
    phpStringDouble = { fg = p.darkYellow, italic = italic_strings },
    phpStringSingle = { fg = p.darkYellow, italic = italic_strings },
    phpDocTags = { fg = p.blueGreen, italic = italic_comments },
    phpDocParam = { fg = p.fg, italic = italic_parameters },

    -- Ruby
    rubyClass = { fg = p.brightGreen, italic = italic_keywords },
    rubyModule = { fg = p.brightGreen, italic = italic_keywords },
    rubyDefine = { fg = p.brightGreen, italic = italic_keywords },
    rubyInclude = { fg = p.blueGreen },
    rubyInterpolation = { fg = p.green },
    rubyInterpolationDelimiter = { fg = p.green },
    rubySymbol = { fg = p.crimson },
    rubyStringDelimiter = { fg = p.darkYellow },
    rubyBlockParameter = { fg = p.fg, italic = italic_parameters },

    -- Python
    pythonBuiltin = { fg = p.darkOrange },
    pythonBuiltinFunc = { fg = p.green },
    pythonBuiltinObj = { fg = p.crimson },
    pythonFunction = { fg = p.green, italic = italic_functions },
    pythonDecorator = { fg = p.blueGreen },
    pythonDecoratorName = { fg = p.blueGreen },
    pythonInclude = { fg = p.blueGreen },
    pythonImport = { fg = p.blueGreen },
    pythonOperator = { fg = p.blueGreen },
    pythonStatement = { fg = p.brightGreen, italic = italic_keywords },

    -- Lua
    luaFunc = { fg = p.green, italic = italic_functions },
    luaFunction = { fg = p.brightGreen, italic = italic_keywords },
    luaTable = { fg = p.altfg },

    -- JavaScript/TypeScript
    javaScriptIdentifier = { fg = p.fg, italic = italic_variables },
    javaScriptFunction = { fg = p.brightGreen, italic = italic_keywords },
    javaScriptNumber = { fg = p.crimson },
    javaScriptNull = { fg = p.crimson },
    javaScriptBraces = { fg = p.altfg },
    typescriptImport = { fg = p.blueGreen },
    typescriptExport = { fg = p.blueGreen },
    typescriptVariable = { fg = p.brightGreen, italic = italic_keywords },
    typescriptIdentifier = { fg = p.darkOrange, bold = true },
    typescriptBraces = { fg = p.altfg },

    -- JSON
    jsonKeyword = { fg = p.green },
    jsonString = { fg = p.darkYellow, italic = italic_strings },
    jsonNumber = { fg = p.crimson },
    jsonBoolean = { fg = p.crimson },
    jsonNull = { fg = p.crimson },
    jsonQuote = { fg = p.altfg },
    jsonBraces = { fg = p.altfg },

    -- YAML
    yamlKey = { fg = p.green },
    yamlAnchor = { fg = p.fg },
    yamlAlias = { fg = p.fg },
    yamlDocumentHeader = { fg = p.darkYellow },

    -- CSS
    cssClassName = { fg = p.darkOrange },
    cssClassNameDot = { fg = p.darkOrange },
    cssIdentifier = { fg = p.green },
    cssProp = { fg = p.teal },
    cssAttr = { fg = p.crimson },
    cssColor = { fg = p.crimson },
    cssVendor = { fg = p.teal },
    cssPseudoClass = { fg = p.crimson },
    cssPseudoClassId = { fg = p.green },
    cssSelectorOp = { fg = p.altfg },
    cssTagName = { fg = p.green },
    cssImportant = { fg = p.crimson, bold = true },

    -- Shell
    shVariable = { fg = p.fg, italic = italic_variables },
    shShellVariables = { fg = p.fg, italic = italic_variables },
    shFunction = { fg = p.green, italic = italic_functions },
    shStatement = { fg = p.brightGreen, italic = italic_keywords },
    shCommandSub = { fg = p.fg },

    -- Vim script
    vimVar = { fg = p.fg, italic = italic_variables },
    vimFunc = { fg = p.green, italic = italic_functions },
    vimFunction = { fg = p.green, italic = italic_functions },
    vimUserFunc = { fg = p.green, italic = italic_functions },
    vimCommand = { fg = p.brightGreen, italic = italic_keywords },
    vimLet = { fg = p.brightGreen, italic = italic_keywords },
    vimOption = { fg = p.fg },
    vimSet = { fg = p.brightGreen, italic = italic_keywords },

    -- Go
    goPackage = { fg = p.brightGreen, italic = italic_keywords },
    goImport = { fg = p.brightGreen, italic = italic_keywords },
    goBuiltins = { fg = p.green },
    goType = { fg = p.darkOrange },
    goStruct = { fg = p.darkOrange },
    goDeclaration = { fg = p.brightGreen, italic = italic_keywords },
    goFunction = { fg = p.green, italic = italic_functions },
    goConditional = { fg = p.brightGreen, italic = italic_keywords },
    goVar = { fg = p.brightGreen, italic = italic_keywords },
    goConst = { fg = p.brightGreen, italic = italic_keywords },

    -- Rust
    rustModPath = { fg = p.fg },
    rustSelf = { fg = p.darkOrange, bold = true },
    rustSuper = { fg = p.darkOrange },
    rustDerive = { fg = p.blueGreen },
    rustEnumVariant = { fg = p.green },
    rustMacro = { fg = p.green },
    rustAttribute = { fg = p.cmt },
    rustDeriveTrait = { fg = p.teal },
    rustCommentLineDoc = { fg = p.cmt, italic = italic_comments },
  }
end

return { get = get }
