local palette = require("monalisa.palette")
local config = require("monalisa.config")

---Get LSP and diagnostic highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent
  local italic = config.italics

  local bg = transparent and p.none or p.bg

  return {
    -- LSP references
    LspReferenceText = { link = "Normal" },
    LspReferenceRead = { link = "Normal" },
    LspReferenceWrite = { link = "Normal" },
    LspInlayHint = { link = "Comment" },
    LspCodeLens = { link = "Comment" },
    LspSignatureActiveParameter = { bold = true, italic = italic, underline = true },

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
    DiagnosticUnderlineError = { underline = true },
    DiagnosticUnderlineWarn = { underline = true },
    DiagnosticUnderlineInfo = { underline = true },
    DiagnosticUnderlineHint = { underline = true },
    DiagnosticUnderlineOk = { underline = true },

    -- Special diagnostics
    DiagnosticUnnecessary = { fg = p.cmt, underline = true },
    DiagnosticDeprecated = { sp = p.crimson, strikethrough = true },

    -- LSP semantic tokens (types)
    ["@lsp.type.class"] = { link = "Type" },
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "Type" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "Type" },
    ["@lsp.type.keyword"] = { link = "Keyword" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { link = "Identifier" },
    ["@lsp.type.number"] = { link = "Number" },
    ["@lsp.type.operator"] = { link = "Operator" },
    ["@lsp.type.parameter"] = { link = "Identifier" },
    ["@lsp.type.property"] = { link = "Identifier" },
    ["@lsp.type.string"] = { link = "String" },
    ["@lsp.type.struct"] = { link = "Type" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "Type" },
    ["@lsp.type.variable"] = { link = "Identifier" },

    -- LSP semantic token modifiers
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = { italic = italic },
    ["@lsp.mod.constant"] = { link = "Constant" },
    ["@lsp.mod.static"] = { italic = italic },
    ["@lsp.mod.async"] = { italic = italic },
    ["@lsp.mod.defaultLibrary"] = { link = "Special" },
    ["@lsp.mod.abstract"] = { italic = italic },
    ["@lsp.mod.virtual"] = { italic = italic },

    -- LSP semantic token type + modifier combinations
    ["@lsp.typemod.function.defaultLibrary"] = { link = "Special" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "Special" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "Special" },
    ["@lsp.typemod.variable.readonly"] = { fg = p.crimson, italic = italic },
    ["@lsp.typemod.variable.constant"] = { link = "Constant" },
    ["@lsp.typemod.property.readonly"] = { fg = p.crimson, italic = italic },
    ["@lsp.typemod.parameter.readonly"] = { italic = italic },
    ["@lsp.typemod.function.async"] = { fg = p.darkOrange, italic = italic },
    ["@lsp.typemod.method.async"] = { fg = p.darkOrange, italic = italic },
  }
end

return { get = get }
