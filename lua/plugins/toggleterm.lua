local zellij

return {
  "akinsho/nvim-toggleterm.lua",
  cmd = { "TermExec", "TermNew", "ToggleTerm" },
  keys = {
    {
      "<leader>th",
      "<cmd>TermNew size=15 direction=horizontal name=terminal<cr>",
      desc = "Nueva terminal horizontal",
    },
    {
      "<leader>tv",
      "<cmd>TermNew size=80 direction=vertical name=terminal<cr>",
      desc = "Nueva terminal vertical",
    },
    {
      "<leader>tz",
      function()
        if not zellij then
          local Terminal = require("toggleterm.terminal").Terminal
          zellij = Terminal:new({
            cmd = "zellij attach --create nvim",
            direction = "horizontal",
            hidden = true,
          })
        end
        zellij:toggle()
      end,
      desc = "Zellij (sesión nvim)",
    },
  },
  config = function()
    require("toggleterm").setup({
      hide_numbers = false,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = false,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = "zsh",
      float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}
