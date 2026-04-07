local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get LSP and diagnostic highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent

  local italic_comments = config.is_italic("comments")
  local italic_keywords = config.is_italic("keywords")
  local italic_functions = config.is_italic("functions")
  local italic_variables = config.is_italic("variables")
  local italic_parameters = config.is_italic("parameters")

  return {
    -- LSP references
    LspReferenceText = { link = "Normal" },
    LspReferenceRead = { link = "Normal" },
    LspReferenceWrite = { link = "Normal" },
    LspInlayHint = { link = "Comment" },
    LspCodeLens = { link = "Comment" },
    LspSignatureActiveParameter = { fg = p.crimson, bold = true, underline = true },

    -- Diagnostics
    DiagnosticError = { fg = p.crimson },
    DiagnosticWarn = { fg = p.darkOrange },
    DiagnosticInfo = { fg = p.blueGreen },
    DiagnosticHint = { fg = p.cmt },
    DiagnosticOk = { fg = p.brightGreen },

    -- Diagnostic signs
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignOk = { link = "DiagnosticOk" },

    -- Virtual text
    DiagnosticVirtualTextError = { link = "DiagnosticError" },
    DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
    DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
    DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
    DiagnosticVirtualTextOk = { link = "DiagnosticOk" },

    -- Floating diagnostics
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },

    -- Underline diagnostics
    DiagnosticUnderlineError = { sp = p.crimson, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.darkOrange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.blueGreen, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.cmt, undercurl = true },
    DiagnosticUnderlineOk = { sp = p.brightGreen, undercurl = true },

    -- Special diagnostics
    DiagnosticUnnecessary = { fg = p.cmt },
    DiagnosticDeprecated = { fg = p.cmt, strikethrough = true },

    -- LSP semantic tokens (types)
    ["@lsp.type.class"] = { fg = p.darkOrange },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { fg = p.blueGreen },
    ["@lsp.type.enum"] = { fg = p.darkOrange },
    ["@lsp.type.enumMember"] = { fg = p.crimson },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { fg = p.darkOrange },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { fg = p.blueGreen },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.regexp"] = { link = "@string.regexp" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.struct"] = { fg = p.darkOrange },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { fg = p.darkOrange },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- LSP semantic token modifiers
    ["@lsp.mod.declaration"] = {},
    ["@lsp.mod.definition"] = {},
    ["@lsp.mod.readonly"] = { fg = p.crimson },
    ["@lsp.mod.static"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.abstract"] = { italic = true },
    ["@lsp.mod.async"] = {},
    ["@lsp.mod.modification"] = {},
    ["@lsp.mod.documentation"] = { italic = italic_comments },
    ["@lsp.mod.defaultLibrary"] = {},

    -- LSP semantic token type + modifier combinations
    ["@lsp.typemod.function.declaration"] = { fg = p.green, bold = true },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = p.green },
    ["@lsp.typemod.method.declaration"] = { fg = p.green, bold = true },
    ["@lsp.typemod.variable.readonly"] = { fg = p.crimson },
    ["@lsp.typemod.variable.globalScope"] = { fg = p.fg, bold = true },
    ["@lsp.typemod.variable.constant"] = { fg = p.crimson },
    ["@lsp.typemod.parameter.declaration"] = { link = "@variable.parameter" },
    ["@lsp.typemod.property.readonly"] = { fg = p.teal },
    ["@lsp.typemod.class.declaration"] = { fg = p.darkOrange, bold = true },
    ["@lsp.typemod.interface.declaration"] = { fg = p.darkOrange, bold = true },
  }
end

return { get = get }
