return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    
    -- bigfile = { enabled = true },
    dashboard = { 
      enabled = true,
      preset = {
        header = [[
⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⢿⣿⣿⡻⡿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣫⣴⣾⣿⣿
⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⡇⠘⠻⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠘⣿⣿⣿⣿⢸⣿⣿⣿⣏⢡⣶⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣏⣀⣭⣭⡝⣿⡝⣿⣿⣿⣿⠁⠀⣤⣬⣝⡂⢰⣶⣦⣤⣤⣤⣀⣀⡀⠀⠀⠘⢿⣿⣿⢸⣿⣿⣿⣏⢓⡙⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⢱⡿⠁⠸⣿⣿⣿⢰⣤⣿⣿⣿⣿⣶⠿⢛⣙⠛⢋⣽⣿⣿⣿⡖⢄⠈⢿⣿⡘⣿⣿⣿⣿⣎⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡏⡾⠁⠀⠀⢹⣿⣿⠈⣿⣿⣿⣿⣿⠋⢴⠋⣭⠙⣿⣿⣿⣿⣿⣿⣿⠀⠈⢿⡇⠈⢿⣿⣿⣿⡸⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⠘⡁⠀⠀⠀⠀⠻⣿⠸⢿⣿⠛⣿⣅⣐⡘⠳⠂⣠⣿⣿⡛⣻⣿⣧⡿⠀⠀⠈⠁⠀⠀⢙⢿⣿⣧⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣇⣼⡇⠀⠀⠀⠀⠀⠹⠀⠚⠛⠒⠛⠛⠛⠛⠛⠛⠻⠟⠻⠿⢿⣟⣉⡇⠀⠀⠀⠀⠀⠀⠸⡇⣙⠻⡜⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⣀⣀⡀⢄⠠⢤⣤⣤⣤⣤⣤⣤⡀⣀⣀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠁⢿⣷⣄⢹⣿⣿⡿⠿
⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⣶⡖⣼⡿⠛⡛⠃⠀⢀⠈⠛⢟⣵⣿⣿⡇⠿⠛⡀⠀⠀⠐⠶⣦⣤⡄⣀⡀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⡇⣿⣇⢸⡇⠯⠇⣤⢳⣀⣿⣿⣿⣿⠏⢀⡞⣠⠠⣗⠌⡗⢨⣿⡇⣿⡏⠀⢰⠀⠙⣷⣶⣿⣿⣿⣷⣶
⣿⣿⣿⣿⣿⣿⣿⣿⠰⠃⠀⢡⣿⣿⣷⣭⣷⣭⣭⣼⣿⣿⣿⣿⡇⣴⣿⣷⣭⣓⣀⣚⣤⣾⣿⡇⡿⠀⢢⡎⣤⡀⠈⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢶⣸⡿⠟⣛⣭⣵⣾⣿⣿⣿⣿⣿⣿⣤⣿⣿⣿⡿⣿⠿⢿⣿⣿⣿⡇⠁⠀⠘⣰⣿⣧⠀⠈⢿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣧⠱⣦⡙⣷⣿⣿⠿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⡻⢿⣶⣭⣝⠻⢃⣴⡯⣰⣿⣿⣿⡄⠀⠸⠿⠿⠿⠿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡙⠃⢿⢋⣵⣾⢿⣿⣿⣿⣿⠋⠛⠛⠛⢻⣿⣿⣿⡿⣷⣌⡻⣿⡟⣈⠋⠄⣿⣿⣿⣿⣿⣄⠀⠀⠀⢠⣄
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠉⠀⠀⠁⠀⠀⠀⠙⣿⣿⣿⣷⣄⣀⣤⣾⣿⡿⣿⣿⣮⠻⣿⡎⣰⡏⣶⠸⣿⣿⣿⣿⣿⣿⣦⡀⠀⠸⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢰⣏⣉⠩⠭⠭⠿⠶⠷⢖⣂⣠⣿⣿⣷⡝⣠⢩⡇⠈⠀⠈⠉⠛⠿⢿⣿⣿⣿⣦⣀⢸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⡰⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢲⣌⡻⠿⣿⣿⣿⡿⠿⠛⠉⠐⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠆⠀⠀⠀⠀⠀⠀⢀⢄⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⢸⡿⠋⢠⣤⠀⠀⣠⠆⠀⠀⢡⣾⡄⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿
]],
      },
    },
    indent = { enabled = true },
    --input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    lazygit = {},

  },

  keys = {
    -- Top Pickers & Explorer
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- LSP
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
