-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("notes").setup()
-- Abrir el panel de bases de datos
vim.keymap.set("n", "<leader>du", ":DBUI<CR>", { desc = "Abrir DBUI" })

-- Abrir resultados en un buffer flotante
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = 40
vim.g.db_ui_show_help = 0

-- Guardar conexiones en este archivo
vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.g.python3_host_prog = "/opt/homebrew/anaconda3/bin/python"

vim.g.dbs = {
  -- ===============================
  -- ░█▀▄░█▀█░█░░░█▀▀░█░█░█▀█░█░█
  -- ░█▄▀░█▀█░█░░░█░░░░█░░█░█░█▀█
  -- ===============================

  -- Conexión general al servidor MySQL
  mysql_root = "mysql://root:chandelier91@127.0.0.1:3306",

  -- Bases de datos específicas
  autos_mx = "mysql://root:chandelier91@127.0.0.1:3306/autos_mx?local_infile=1",
  small_db = "mysql://root:chandelier91@127.0.0.1:3306/small_db_project?local_infile=1",
  chinook_db = "mysql://root:chandelier91@127.0.0.1:3306/Chinook?local_infile=1",
  ecommerce_db = "mysql://root:chandelier91@127.0.0.1:3306/ecommerce_db?local_infile=2",

  -- ===============================
  -- ░█▀░░█▀█░█░░░█▀▀░█▀▀░█▀█░█▀▄
  -- ░█░░░█▀█░█░░░█▀▀░█▀▀░█░█░█▀▄
  -- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀
  -- ===============================

  -- SQL Server corriendo en Docker
  sqlsrv_local = "sqlserver://sa:Thread4-Iphone-Sincerity-Seventeen@localhost:1433/master",

  -- PostgreSQL corriendo en Docker (prioriza variables de entorno)
  docker_postgres = os.getenv("DB_DOCKER_URL")
    or os.getenv("DATABASE_URL")
    or "postgres://postgres:postgres@127.0.0.1:5432/postgres",
}
