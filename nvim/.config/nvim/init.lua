if vim.g.vscode then
  require('config.vs_code')
else
  require('config.lazy')
end

--> Project specific configs

-- Get the name of the current working directory folder
local current_project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

-- Standardize the string for Luarocks/Neovim module naming
-- (Replaces spaces/dashes with underscores to prevent syntax issues in require paths)
local module_name = "project_configs." .. current_project:gsub("[%s%-]", "_")

-- Safely try to require the project-specific config module
pcall(require, module_name)
