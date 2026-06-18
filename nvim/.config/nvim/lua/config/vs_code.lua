vim.g.mapleader = ' '

--> # Mapping
local vscode = require('vscode')

--> Toggle file explorer
vim.keymap.set('n', '<leader>fe', function() 
  vscode.call('workbench.action.toggleSidebarVisibility')
end)
--vim.keymap.set('n', '<leader>fe', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')

--> Find file
vim.keymap.set('n', '<leader>ff', function() 
  vscode.call('workbench.action.quickOpen')
end)
--vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')

--> Next diagnostic
vim.keymap.set('n', '<leader>]d', function()
  vscode.call('editor.action.marker.next')
end)

--> Prev diagnostic
vim.keymap.set('n', '<leader>[d', function()
  vscode.call('editor.action.marker.prev')
end)

--> Trigger Code Actions
vim.keymap.set('n', '<leader>ca', function()
  vscode.call('closeMarkersNavigation')
  vscode.call('editor.action.quickFix')
end)

--> Show hover (error details, type info, etc.)
vim.keymap.set('n', '<leader>K', function()
  vscode.call('editor.action.showHover')
end)
