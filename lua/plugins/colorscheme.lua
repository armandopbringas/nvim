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
    opts = {
      colorscheme = "tokyonight-night",
    },
    init = function()
      require("config.retrobox").setup()
    end,
  },
}
