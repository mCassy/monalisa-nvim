local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get treesitter highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local italic = config.italics

  return {
    -- Identifiers
    ["@variable"] = { fg = p.fg, italic = italic },
    ["@variable.builtin"] = { fg = p.darkOrange, italic = italic },
    ["@variable.parameter"] = { fg = p.fg, italic = italic },
    ["@variable.member"] = { link = "Identifier" },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Constant" },
    ["@constant.macro"] = { link = "Define" },

    -- Modules/Namespaces
    ["@module"] = { link = "Identifier" },
    ["@namespace"] = { link = "Identifier" },

    -- Strings
    ["@string"] = { link = "String" },
    ["@string.documentation"] = { link = "Comment" },
    ["@string.escape"] = { link = "String" },
    ["@string.regex"] = { link = "Special" },
    ["@string.special"] = { link = "String" },

    -- Characters
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "String" },

    -- Booleans & Numbers
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@float"] = { link = "Float" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "Keyword" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@structure"] = { link = "Type" },

    -- Attributes/Annotations
    ["@attribute"] = { link = "Special" },

    -- Functions
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Function" },
    ["@function.method"] = { link = "Function" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },

    -- Constructors
    ["@constructor"] = { link = "Special" },

    -- Operators & Punctuation
    ["@operator"] = { link = "Operator" },
    ["@punctuation"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "DelimiterLight" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Special" },

    -- Keywords
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.coroutine"] = { link = "Keyword" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.operator"] = { link = "Keyword" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.storage"] = { link = "StorageClass" },

    -- Labels
    ["@label"] = { link = "Label" },

    -- Comments
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"] = { link = "DiagnosticError" },
    ["@comment.warning"] = { link = "DiagnosticWarn" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "DiagnosticHint" },

    -- Properties/Fields
    ["@property"] = { fg = p.teal, italic = italic },
    ["@field"] = { link = "Field" },
    ["@parameter"] = { link = "Identifier" },

    -- Tags
    ["@tag"] = { link = "Special" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    -- Text/Markup
    ["@text"] = { link = "Normal" },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = italic },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { link = "Comment" },
    ["@text.uri"] = { link = "Underlined" },
    ["@text.reference"] = { link = "Identifier" },
    ["@text.todo"] = { link = "Todo" },
    ["@text.diff.add"] = { link = "DiffAdd" },
    ["@text.diff.change"] = { link = "DiffChange" },
    ["@text.diff.delete"] = { link = "DiffDelete" },

    -- Markup (new Neovim captures)
    ["@markup"] = { link = "Normal" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = italic },
    ["@markup.underline"] = { underline = true },
    ["@markup.strike"] = { strikethrough = true },
    ["@markup.heading"] = { link = "Title" },
    ["@markup.raw"] = { link = "Comment" },
    ["@markup.link"] = { link = "Underlined" },
    ["@markup.link.label"] = { link = "Identifier" },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@markup.list"] = { link = "Delimiter" },
    ["@markup.math"] = { link = "Special" },

    -- Diff
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },

    -- Preproc
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@include"] = { link = "Include" },
    ["@macro"] = { link = "Macro" },

    -- Errors
    ["@error"] = { link = "Error" },

    -- None (for disabling)
    ["@none"] = {},
  }
end

return { get = get }
