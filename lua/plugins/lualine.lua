return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          function()
            return ""
          end,
          color = { fg = "#1d2021", bg = "#b8bb26", gui = "bold" },
          padding = { left = 1, right = 1 },
        },
        {
          "mode",
          color = { fg = "#1d2021", bg = "#b8bb26", gui = "bold" },
        },
      },

      -- Branch Git con fondo oscuro
      lualine_b = {
        {
          "branch",
          icon = "",
          color = { fg = "#83a598", bg = "#1d2021" },
        },
      },

      -- Nombre de archivo
      lualine_c = {
        {
          "filename",
          color = { fg = "#ebdbb2", bg = "#1d2021" },
        },
      },

      -- Encoding, Fileformat y Filetype con fondo alternativo
      lualine_x = {
        {
          "encoding",
          color = { fg = "#ebdbb2", bg = "#3c3836" },
        },
        {
          "fileformat",
          color = { fg = "#ebdbb2", bg = "#3c3836" },
        },
        {
          "filetype",
          color = { fg = "#ebdbb2", bg = "#3c3836" },
        },
      },

      -- Progreso
      lualine_y = {
        {
          "progress",
          color = { fg = "#83a598", bg = "#3c3836" },
        },
      },

      -- Ubicación
      lualine_z = {
        {
          "location",
          color = { fg = "#d3869b", bg = "#1d2021" },
        },
      },
    },
  },
}
