vim.g.mapleader = ' '

--> # Mapping

--> Toggle file explorer
vim.keymap.set('n', '<leader>fe', function() 
  require('vscode').call('workbench.action.toggleSidebarVisibility')
end)
--vim.keymap.set('n', '<leader>fe', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')

--> Find file
vim.keymap.set('n', '<leader>ff', function() 
  require('vscode').call('workbench.action.quickOpen')
end)
--vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')

--> Next diagnostic
vim.keymap.set('n', '<leader>]d', function()
  require('vscode').call('editor.action.marker.next')
end)

--> Prev diagnostic
vim.keymap.set('n', '<leader>[d', function()
  require('vscode').call('editor.action.marker.prev')
end)

--> Trigger Code Actions
vim.keymap.set('n', '<leader>ca', function()
  require('vscode').call('closeMarkersNavigation')
  require('vscode').call('editor.action.quickFix')
end)

--> Show hover (error details, type info, etc.)
vim.keymap.set('n', '<leader>K', function()
  require('vscode').call('editor.action.showHover')
end)
