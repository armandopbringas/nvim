vim.keymap.set("n", "<leader>uR", function()
  require("config.tmux_theme").apply()
  vim.notify("Tema de tmux: " .. vim.g.colors_name)
end, { desc = "Sincronizar tema con tmux" })
