return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      opts = opts or {}
      opts.defaults = opts.defaults or {}
      opts.defaults.path_display = opts.defaults.path_display or { "smart" }
      return opts
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
