return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- Optional image support for file preview: See `# Preview Mode` for more information.
    -- {'3rd/image.nvim', opts = {}},
    -- OR use snacks.nvim's image module:
    -- 'folke/snacks.nvim',
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module 'neo-tree'
  ---@type neotree.Config?
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
  },
  keys = {
    { '<leader>fe', '<cmd>Neotree toggle<cr>', desc = 'NeoTree toggle' },
  },
}
