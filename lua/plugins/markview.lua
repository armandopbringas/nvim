return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        icon_provider = "internal",
      },
    },
    keys = {
      { "<leader>tv", "<cmd>Markview toggle<CR>", desc = "Markview: toggle buffer" },
      { "<leader>tV", "<cmd>Markview Toggle<CR>", desc = "Markview: toggle global" },
      { "<leader>ts", "<cmd>Markview splitToggle<CR>", desc = "Markview: split view" },
      { "<leader>th", "<cmd>Markview hybridToggle<CR>", desc = "Markview: hybrid view" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local parsers = {
        "markdown",
        "markdown_inline",
        "html",
        "latex",
        "typst",
        "yaml",
      }

      opts.ensure_installed = opts.ensure_installed or {}

      for _, parser in ipairs(parsers) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
  },
}
