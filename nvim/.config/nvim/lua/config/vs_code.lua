vim.g.mapleader = ' '

--> # Mapping
local vscode = require('vscode')

--> Toggle file explorer
vim.keymap.set('n', '<leader>fe', function() 
  vscode.action('workbench.action.toggleSidebarVisibility')
end)

--> Find file
vim.keymap.set('n', '<leader>ff', function() 
  vscode.action('workbench.action.quickOpen')
end)

--> Find buffer / Tab switcher
vim.keymap.set('n', '<leader>fb', function() 
  vscode.action('workbench.action.showAllEditorsByMostRecentlyUsed')
  --> same as above, but without search
  -- vscode.action('workbench.action.quickOpenPreviousRecentlyUsedEditor')
end)

--> Next diagnostic
vim.keymap.set('n', '<leader>]d', function()
  vscode.action('editor.action.marker.next')
end)

--> Prev diagnostic
vim.keymap.set('n', '<leader>[d', function()
  vscode.action('editor.action.marker.prev')
end)

--> Trigger Code Actions
vim.keymap.set('n', '<leader>ca', function()
  vscode.action('closeMarkersNavigation')
  vscode.action('editor.action.quickFix')
end)

--> Show hover (error details, type info, etc.)
vim.keymap.set('n', '<leader>K', function()
  vscode.action('editor.action.showHover')
end)
