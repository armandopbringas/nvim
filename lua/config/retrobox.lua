local M = {}

function M.setup()
  local group = vim.api.nvim_create_augroup("retrobox_overrides", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "dbout",
    callback = function()
      -- Dadbod muestra tablas de texto. Estos grupos colorean su estructura
      -- sin cambiar el filetype ni los mapeos propios de DBUI.
      vim.cmd("syntax match DadbodResultBorder /[+|]/")
      vim.cmd("syntax match DadbodResultSeparator /^+[-+]\\+$/")
      vim.cmd("syntax match DadbodResultHeader /\\%2l^|.*|$/")
      vim.cmd("syntax match DadbodResultNumber /[-+]\\?\\d\\+\\(\\.\\d\\+\\)\\?/")
      vim.cmd("syntax match DadbodResultNull /\\c\\v<(NULL|null|nil)>/")
    end,
  })

  vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
    group = group,
    pattern = { "retrobox", "LazyVimStarted" },
    callback = function()
      if vim.g.colors_name ~= "retrobox" then
        return
      end

      -- Conserva el tema activo y aplica solo los colores de resultados DBUI.
      --   vim.api.nvim_set_hl(0, "DadbodResultBorder", { fg = "#83a598" })
      --   vim.api.nvim_set_hl(0, "DadbodResultSeparator", { fg = "#83a598" })
      --   vim.api.nvim_set_hl(0, "DadbodResultHeader", { fg = "#b8bb26", bold = true })
      --   vim.api.nvim_set_hl(0, "DadbodResultNumber", { fg = "#d3869b" })
      --   vim.api.nvim_set_hl(0, "DadbodResultNull", { fg = "#fe8019", italic = true })
      --   return
      -- end

      -- UI global
      -- vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#83a598", bold = true })
      -- vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#83a598" })
      -- vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#ebdbb2" })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#d3869b", bold = true })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#ebdbb2", bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#B8BB26", bold = true })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlineInput", { fg = "#b8bb26", bg = "NONE", bold = false })
      -- vim.cmd("highlight! link NoiceCmdlineInput Normal")
      -- vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { fg = "#E65559" })
      -- vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticSelected", { fg = "#E65559" })

      -- LazyVim
      -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#282828", fg = "#ebdbb2" })
      -- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#282828", fg = "#ebdbb2" })
      -- vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#282828" })
      -- vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#b8bb26" })
      -- vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#E65559" })
      -- vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { fg = "#83a598" })

      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828", fg = "#ebdbb2" })
      -- vim.api.nvim_set_hl(0, "Keyword", { fg = "#E65559", bold = false })
      -- vim.api.nvim_set_hl(0, "@keyword", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@keyword.javascript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@keyword.typescript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@keyword.tsx", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@keyword.declaration", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@variable", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@variable.javascript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@variable.typescript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@variable.tsx", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@lsp.type.variable.javascript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@lsp.type.variable.typescript", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "@lsp.type.variable.tsx", { fg = "#fe8019" })
      -- vim.api.nvim_set_hl(0, "Conditional", { fg = "#d3869b", bold = false })
      -- vim.api.nvim_set_hl(0, "@type", { fg = "#ebdbb2", bold = false })
      -- vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#ebdbb2", bold = false })
      -- vim.api.nvim_set_hl(0, "Function", { fg = "#B8BB26", bold = false })
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#9E9E9E", italic = false })
      -- vim.api.nvim_set_hl(0, "Exception", { fg = "#ebdbb2", bold = false })
      -- vim.api.nvim_set_hl(0, "Repeat", { fg = "#d3869b", bold = false })
      -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#9E9E9E", bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebdbb2", bg = "NONE", bold = true })
      -- vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#B8BB26", bold = true })

      -- Syntax: Python
      vim.api.nvim_set_hl(0, "@keyword.python", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "@keyword.function.python", { fg = "#fe8019" })
      vim.api.nvim_set_hl(0, "@keyword.conditional.python", { fg = "#d3869b" })
      vim.api.nvim_set_hl(0, "@keyword.return.python", { fg = "#E65559" })
      vim.api.nvim_set_hl(0, "@keyword.repeat.python", { fg = "#E65559" })
      vim.api.nvim_set_hl(0, "@keyword.exception.python", { fg = "#d3869b" })
      vim.api.nvim_set_hl(0, "@keyword.operator.python", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "@operator.python", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "@punctuation.delimiter.python", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "@comment.python", { fg = "#9E9E9E" })
      vim.api.nvim_set_hl(0, "@variable.python", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@variable.python.member", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@variable.parameter.python", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@function.builtin.python", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "@function.method.call.python", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@constant.builtin.python", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@type.builtin.python", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "@module.python", { fg = "#ebdbb2" })

      -- Syntax: SQL
      vim.api.nvim_set_hl(0, "@keyword.sql", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "@type.builtin.sql", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "@function", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@function.sql", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@function.call.sql", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@sqlFunction", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@attribute.sql", { fg = "#fe8019" })
      vim.api.nvim_set_hl(0, "@operator.sql", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "@keyword.operator.sql", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "@keyword.modifier.sql", { fg = "#fe8019" })
      vim.api.nvim_set_hl(0, "@string.sql", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@variable.sql", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "@variable.member.sql", { fg = "#ebdbb2" })

      -- Resultados MySQL de DadbodUI
      vim.api.nvim_set_hl(0, "mysqlKeyword", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "mysqlFunction", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "mysqlOperator", { fg = "#8EC07C" })
      vim.api.nvim_set_hl(0, "mysqlString", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "mysqlNumber", { fg = "#d3869b" })
      vim.api.nvim_set_hl(0, "mysqlSpecial", { fg = "#d3869b" })

      vim.api.nvim_set_hl(0, "mysqlFlowLabel", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "mysqlOperator", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "DadbodResultBorder", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "DadbodResultSeparator", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "DadbodResultHeader", { fg = "#b8bb26", bold = true })
      vim.api.nvim_set_hl(0, "DadbodResultNumber", { fg = "#d3869b" })
      vim.api.nvim_set_hl(0, "DadbodResultNull", { fg = "#fe8019", italic = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#E65559", bold = false })
      vim.api.nvim_set_hl(0, "BufferLineError", { fg = "#E65559", bold = false })
      vim.api.nvim_set_hl(0, "BufferLineErrorSelected", { fg = "#E65559", bold = false })
    end,
  })
end

return M
