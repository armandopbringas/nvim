local M = {}

local tmux_themes = {
  gruvbox = "retrobox",
  tokyonight = "tokyonight-night",
}

function M.colorscheme()
  if vim.env.TMUX == nil or vim.fn.executable("tmux") == 0 then
    return "retrobox"
  end

  local active_theme = vim.fn.trim(vim.fn.system({ "tmux", "show-option", "-gv", "@active_theme" }))
  return tmux_themes[active_theme] or "retrobox"
end

function M.apply()
  local colorscheme = M.colorscheme()

  if vim.g.colors_name ~= colorscheme then
    vim.cmd.colorscheme(colorscheme)
  end
end

function M.setup()
  local group = vim.api.nvim_create_augroup("tmux_theme", { clear = true })

  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = M.apply,
  })
end

return M
