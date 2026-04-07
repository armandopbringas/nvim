local M = {}

local notes_dir = vim.fn.expand("~/notes")
M.notes_dir = notes_dir
local subdirs = {
  "inbox",
  "playbooks",
  "templates",
  "cases",
  "snippets",
  "glossary",
}

local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "Notes" })
end

local function ensure_notes_dirs()
  vim.fn.mkdir(notes_dir, "p")
  for _, dir in ipairs(subdirs) do
    vim.fn.mkdir(notes_dir .. "/" .. dir, "p")
  end
end

local function with_telescope(callback)
  local ok, builtin = pcall(require, "telescope.builtin")
  if not ok then
    notify("Telescope no esta disponible. Instala y carga telescope.nvim.", vim.log.levels.ERROR)
    return
  end

  callback(builtin)
end

local function daily_note_path()
  return string.format("%s/%s_daily.md", notes_dir, os.date("%Y-%m-%d"))
end

local function inbox_note_path()
  return string.format("%s/inbox/%s_inbox.md", notes_dir, os.date("%Y-%m-%d"))
end

local function open_file(path)
  vim.cmd.edit(vim.fn.fnameescape(path))
end

local function open_today_note()
  ensure_notes_dirs()
  open_file(daily_note_path())
end

local function append_to_inbox(text)
  ensure_notes_dirs()

  local entry = string.format("- [%s] %s", os.date("%H:%M"), text)
  local path = inbox_note_path()
  vim.fn.writefile({ entry }, path, "a")
  open_file(path)
  vim.cmd.normal({ args = { "G" }, bang = true })
end

local function prompt_inbox()
  vim.ui.input({ prompt = "Inbox: " }, function(input)
    if not input or vim.trim(input) == "" then
      return
    end

    append_to_inbox(vim.trim(input))
  end)
end

local function setup_markdown_folds(args)
  local bufnr = args.buf

  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt_local.foldtext = ""
  vim.opt_local.foldenable = true
  vim.opt_local.foldlevel = 99
  vim.opt_local.foldlevelstart = 99
  vim.opt_local.foldnestmax = 6

  local map = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("<leader>nt", "za", "Notes Toggle Section")
  map("<leader>nO", "zR", "Notes Open All Sections")
  map("<leader>nC", "zM", "Notes Close All Sections")
end

function M.setup()
  if M._setup_done then
    return
  end

  M._setup_done = true
  ensure_notes_dirs()

  vim.api.nvim_create_user_command("NotesFind", function()
    with_telescope(function(builtin)
      builtin.live_grep({ cwd = notes_dir })
    end)
  end, { desc = "Buscar notas por contenido" })

  vim.api.nvim_create_user_command("NotesFiles", function()
    with_telescope(function(builtin)
      builtin.find_files({ cwd = notes_dir, hidden = true })
    end)
  end, { desc = "Buscar archivos de notas" })

  vim.api.nvim_create_user_command("NotesToday", function()
    open_today_note()
  end, { desc = "Abrir nota diaria" })

  vim.api.nvim_create_user_command("NotesInbox", function()
    prompt_inbox()
  end, { desc = "Captura rapida al inbox" })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = setup_markdown_folds,
    desc = "Activa folding por headings en Markdown",
  })

  vim.keymap.set("n", "<leader>nf", "<cmd>NotesFind<CR>", { desc = "Notes Find" })
  vim.keymap.set("n", "<leader>nF", "<cmd>NotesFiles<CR>", { desc = "Notes Files" })
  vim.keymap.set("n", "<leader>nd", "<cmd>NotesToday<CR>", { desc = "Notes Today" })
  vim.keymap.set("n", "<leader>ni", "<cmd>NotesInbox<CR>", { desc = "Notes Inbox" })
end

return M
