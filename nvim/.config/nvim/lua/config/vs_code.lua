vim.g.mapleader = ' '

--> # Mapping
local vscode = require('vscode')

vim.keymap.set('n', '<leader>fe', function() vscode.action('workbench.action.toggleSidebarVisibility') end, { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ff', function() vscode.action('workbench.action.quickOpen') end, { desc = 'Find file' })
vim.keymap.set('n', '<leader>fb', function() 
  vscode.action('workbench.action.showAllEditorsByMostRecentlyUsed')
  --> same as above, but without search
  -- vscode.action('workbench.action.quickOpenPreviousRecentlyUsedEditor')
end, { desc = 'Find buffer / Tab switcher' })

vim.keymap.set('n', ']d', function() vscode.action('editor.action.marker.next') end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', function() vscode.action('editor.action.marker.prev') end, { desc = 'Prev diagnostic' })

vim.keymap.set('n', '<leader>ca', function()
  vscode.action('closeMarkersNavigation')
  vscode.action('editor.action.quickFix')
end, { desc = 'Trigger code actions'})

vim.keymap.set('n', '<leader>K', function() vscode.action('editor.action.showHover') end, { desc = 'Show hover (error details, type info, etc.)' })
