local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get treesitter highlight groups
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
    -- Identifiers
    ["@variable"] = { fg = p.fg, italic = italic_variables },
    ["@variable.builtin"] = { fg = p.darkOrange, bold = true },
    ["@variable.parameter"] = { fg = p.fg, italic = italic_parameters },
    ["@variable.parameter.builtin"] = { fg = p.fg, italic = italic_parameters },
    ["@variable.member"] = { fg = p.fg },

    -- Constants
    ["@constant"] = { fg = p.crimson },
    ["@constant.builtin"] = { fg = p.crimson },
    ["@constant.macro"] = { fg = p.crimson },

    -- Modules/Namespaces
    ["@module"] = { fg = p.fg },
    ["@module.builtin"] = { fg = p.fg },
    ["@label"] = { fg = p.brightGreen },

    -- Literals
    ["@string"] = { fg = p.darkYellow, italic = italic_strings },
    ["@string.documentation"] = { fg = p.cmt, italic = italic_comments },
    ["@string.regexp"] = { fg = p.crimson },
    ["@string.escape"] = { fg = p.green },
    ["@string.special"] = { fg = p.green },
    ["@string.special.symbol"] = { fg = p.crimson },
    ["@string.special.url"] = { fg = p.green, underline = true },
    ["@string.special.path"] = { fg = p.teal },

    ["@character"] = { fg = p.darkYellow },
    ["@character.special"] = { fg = p.green },

    ["@boolean"] = { fg = p.crimson },
    ["@number"] = { fg = p.crimson },
    ["@number.float"] = { fg = p.crimson },

    -- Types
    ["@type"] = { fg = p.darkOrange },
    ["@type.builtin"] = { fg = p.darkOrange },
    ["@type.definition"] = { fg = p.darkOrange },

    ["@attribute"] = { fg = p.blueGreen },
    ["@attribute.builtin"] = { fg = p.blueGreen },
    ["@property"] = { fg = p.teal, italic = italic_variables },

    -- Functions
    ["@function"] = { fg = p.green, italic = italic_functions },
    ["@function.builtin"] = { fg = p.green },
    ["@function.call"] = { fg = p.green },
    ["@function.macro"] = { fg = p.green },
    ["@function.method"] = { fg = p.green },
    ["@function.method.call"] = { fg = p.green },

    ["@constructor"] = { fg = p.darkOrange },

    -- Keywords
    ["@keyword"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.coroutine"] = { fg = p.brightGreen },
    ["@keyword.function"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.operator"] = { fg = p.brightGreen },
    ["@keyword.import"] = { fg = p.blueGreen },
    ["@keyword.type"] = { fg = p.brightGreen },
    ["@keyword.modifier"] = { fg = p.brightGreen },
    ["@keyword.repeat"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.return"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.debug"] = { fg = p.crimson },
    ["@keyword.exception"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.conditional"] = { fg = p.brightGreen, italic = italic_keywords },
    ["@keyword.conditional.ternary"] = { fg = p.brightGreen },
    ["@keyword.directive"] = { fg = p.blueGreen },
    ["@keyword.directive.define"] = { fg = p.blueGreen },
    ["@keyword.storage"] = { fg = p.darkOrange },

    -- Operators and punctuation
    ["@operator"] = { fg = p.blueGreen },

    ["@punctuation.delimiter"] = { fg = p.punc },
    ["@punctuation.bracket"] = { fg = p.altfg },
    ["@punctuation.special"] = { fg = p.blueGreen },

    -- Comments
    ["@comment"] = { fg = p.cmt, italic = italic_comments },
    ["@comment.documentation"] = { fg = p.cmt, italic = italic_comments },
    ["@comment.error"] = { fg = p.crimson },
    ["@comment.warning"] = { fg = p.orange },
    ["@comment.todo"] = { fg = p.darkYellow, bold = true },
    ["@comment.note"] = { fg = p.green },

    -- Markup (for markdown, etc.)
    ["@markup"] = { fg = p.fg },
    ["@markup.strong"] = { fg = p.teal, bold = true },
    ["@markup.italic"] = { fg = p.teal, italic = true },
    ["@markup.strikethrough"] = { fg = p.fg, strikethrough = true },
    ["@markup.underline"] = { underline = true },

    ["@markup.heading"] = { fg = p.green, bold = true },
    ["@markup.heading.1"] = { fg = p.green, bold = true },
    ["@markup.heading.2"] = { fg = p.green, bold = true },
    ["@markup.heading.3"] = { fg = p.green, bold = true },
    ["@markup.heading.4"] = { fg = p.green, bold = true },
    ["@markup.heading.5"] = { fg = p.green, bold = true },
    ["@markup.heading.6"] = { fg = p.green, bold = true },

    ["@markup.quote"] = { fg = p.teal },
    ["@markup.math"] = { fg = p.green },
    ["@markup.environment"] = { fg = p.teal },

    ["@markup.link"] = { fg = p.blueGreen },
    ["@markup.link.label"] = { fg = p.blueGreen },
    ["@markup.link.url"] = { fg = p.teal, italic = true, underline = true },

    ["@markup.raw"] = { fg = p.teal },
    ["@markup.raw.block"] = { fg = p.teal },

    ["@markup.list"] = { fg = p.green },
    ["@markup.list.checked"] = { fg = p.teal },
    ["@markup.list.unchecked"] = { fg = p.cmt },

    -- Legacy text groups (for older parsers)
    ["@text"] = { fg = p.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { fg = p.teal },
    ["@text.uri"] = { fg = p.green, underline = true },
    ["@text.reference"] = { fg = p.blueGreen },
    ["@text.todo"] = { link = "Todo" },

    -- Diff
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },

    -- Tags (HTML/XML/JSX)
    ["@tag"] = { fg = p.green },
    ["@tag.builtin"] = { fg = p.green },
    ["@tag.attribute"] = { fg = p.blueGreen, italic = italic_variables },
    ["@tag.delimiter"] = { fg = p.green },

    -- Misc
    ["@none"] = {},
    ["@conceal"] = { fg = p.cmt },

    ["@definition"] = { underline = true, sp = p.punc },
    ["@scope"] = { bold = true },
    ["@reference"] = { underline = true, sp = p.punc },

    -- Language-specific overrides

    -- JSX/TSX
    ["@tag.tsx"] = { fg = p.darkOrange },
    ["@constructor.tsx"] = { fg = p.darkOrange },
    ["@tag.javascript"] = { fg = p.darkOrange },
    ["@constructor.javascript"] = { fg = p.darkOrange },

    -- Lua
    ["@constructor.lua"] = { fg = p.altfg },

    -- Python
    ["@variable.parameter.python"] = { fg = p.teal, italic = italic_parameters },

    -- YAML
    ["@property.yaml"] = { fg = p.teal },

    -- JSON
    ["@property.json"] = { fg = p.teal },

    -- TOML
    ["@property.toml"] = { fg = p.teal },

    -- PHP
    ["@variable.php"] = { fg = p.fg },
    ["@variable.member.php"] = { fg = p.teal },
    ["@variable.parameter.php"] = { fg = p.fg, italic = italic_parameters },
    ["@property.php"] = { fg = p.teal },

    -- PHP Docblocks
    ["@keyword.phpdoc"] = { fg = p.blueGreen },
    ["@keyword.return.phpdoc"] = { fg = p.blueGreen },
    ["@keyword.modifier.phpdoc"] = { fg = p.blueGreen },
    ["@attribute.phpdoc"] = { fg = p.blueGreen },
    ["@type.phpdoc"] = { fg = p.darkOrange },
    ["@variable.parameter.phpdoc"] = { fg = p.fg, italic = italic_parameters },
    ["@comment.documentation.php"] = { fg = p.cmt, italic = italic_comments },
  }
end

return { get = get }
