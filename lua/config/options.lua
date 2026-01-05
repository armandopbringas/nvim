-- =========================================================
-- ⚙️  Opciones generales de Neovim
-- =========================================================

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Folds: seguros (Treesitter los maneja después)
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false

-- Espaciado vertical (ajustado para macOS + Nerd Font)
vim.opt.linespace = 2

-- =========================================================
-- 💾 Autosave controlado (NO agresivo)
-- =========================================================

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent write")
    end
  end,
})

-- =========================================================
-- ⌨️  Mapeos en terminal (tmux-like navigation)
-- =========================================================

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true })

-- =========================================================
-- 🗃️  Dadbod: salida dbout como CSV
-- =========================================================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.bo.filetype = "csv"
  end,
})

-- ===========================
-- 🎨  Overrides de highlights para Retrobox
-- ===========================
vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
  pattern = { "retrobox", "LazyVimStarted" },
  callback = function()
    -- --------------------------
    -- 🌐 Colores UI global (dashboard, noice, trees, borders)
    -- --------------------------
    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#83a598", bold = true })
    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#83a598" })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#d3869b", bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#ebdbb2", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#B8BB26", bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlineInput", { fg = "#b8bb26", bg = "NONE", bold = false })
    vim.cmd("highlight! link NoiceCmdlineInput Normal")
    vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { fg = "#E65559" })
    vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticSelected", { fg = "#E65559" })

    -- --------------------------
    -- 🪵 LazyVim (colores generales)
    -- --------------------------
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#282828", fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#282828", fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#282828" })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#fe8019" })
    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#E65559" })
    vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { fg = "#83a598" })

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828", fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "#E65559", bold = false })
    vim.api.nvim_set_hl(0, "Conditional", { fg = "#d3869b", bold = false })
    vim.api.nvim_set_hl(0, "@type", { fg = "#ebdbb2", bold = false })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#ebdbb2", bold = false })
    vim.api.nvim_set_hl(0, "Function", { fg = "#B8BB26", bold = false })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#9E9E9E", italic = false })
    vim.api.nvim_set_hl(0, "Exception", { fg = "#ebdbb2", bold = false })
    vim.api.nvim_set_hl(0, "Repeat", { fg = "#d3869b", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9E9E9E", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebdbb2", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#B8BB26", bold = true })

    -- --------------------------
    -- 🐍 Syntax: Python
    -- --------------------------
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

    -- --------------------------
    -- 🧩 Syntax: SQL
    -- --------------------------
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

    -- --------------------------
    -- 🗄️ Resultados de MySQL (Dadbod)
    -- --------------------------
    vim.api.nvim_set_hl(0, "mysqlKeyword", { fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "mysqlFunction", { fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "mysqlString", { fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "mysqlNumber", { fg = "#d3869b" })
    vim.api.nvim_set_hl(0, "mysqlSpecial", { fg = "#fe8019" })
    vim.api.nvim_set_hl(0, "mysqlOperator", { fg = "#83a598" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#E65559", bold = false })
    vim.api.nvim_set_hl(0, "BufferLineError", { fg = "#E65559", bold = false })
    vim.api.nvim_set_hl(0, "BufferLineErrorSelected", { fg = "#E65559", bold = false })
  end,
})
