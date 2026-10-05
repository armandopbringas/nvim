return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      return {
        colorscheme = require("config.tmux_theme").colorscheme(),
      }
    end,
    init = function()
      require("config.retrobox").setup()
      require("config.tmux_theme").setup()
    end,
  },
}
