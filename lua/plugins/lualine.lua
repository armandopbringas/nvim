return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function mode(color)
      return {
        a = { fg = "#1d2021", bg = color, gui = "bold" },
        b = { fg = color, bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      }
    end

    opts.options = opts.options or {}
    opts.options.theme = {
      normal = mode("#b8bb26"), -- Verde
      insert = mode("#83a598"), -- Azul
      visual = mode("#d3869b"), -- Morado
      replace = mode("#fb4934"), -- Rojo
      command = mode("#fe8019"), -- Naranja
      terminal = mode("#8ec07c"), -- Aqua
      inactive = mode("#928374"), -- Gris
    }
  end,
}
