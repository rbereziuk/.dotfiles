return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { '<leader>fe', '<cmd>Neotree toggle<cr>', desc = 'NeoTree toggle' },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['of'] = 'system_open',
        },
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        local os_type = vim.loop.os_uname().sysname

        if os_type == 'Linux' then
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        elseif os_type == 'Darwin' then
          vim.fn.jobstart({ 'open', path }, { detach = true })
        end
      end
    },
    extensions = {
      'neo-tree',
    }
  }
}
