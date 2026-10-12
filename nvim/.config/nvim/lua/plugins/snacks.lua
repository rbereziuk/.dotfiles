local quote_cache

local function wrap_text(text, width)
  local lines, line = {}, ''
  for word in text:gmatch('%S+') do
    local candidate = line == '' and word or (line .. ' ' .. word)
    if vim.api.nvim_strwidth(candidate) <= width then
      line = candidate
    else
      if line ~= '' then
        table.insert(lines, line)
      end
      line = word
    end
  end
  if line ~= '' then
    table.insert(lines, line)
  end
  return lines
end

--- Path to quotes.json inside the rbereziuk/fav-quotes plugin.
---@return string?
local function quotes_file()
  local ok, lazy_config = pcall(require, 'lazy.core.config')
  local plugin = ok and lazy_config.plugins['fav-quotes'] or nil
  if plugin and plugin.dir then
    return plugin.dir .. '/quotes.json'
  end
end

--- Pick one quote from the fav-quotes plugin for the life of the session.
---@return string? quote
---@return string? author
local function random_quote()
  if quote_cache ~= nil then
    return quote_cache.quote, quote_cache.author
  end
  quote_cache = {}

  local path = quotes_file()
  if not path then
    return nil
  end

  local ok, lines = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end

  local decoded_ok, quotes = pcall(vim.json.decode, table.concat(lines, '\n'))
  if not decoded_ok or type(quotes) ~= 'table' or #quotes == 0 then
    return nil
  end

  local entry = quotes[math.random(#quotes)]
  if type(entry) ~= 'table' or type(entry.quote) ~= 'string' or entry.quote == '' then
    return nil
  end

  quote_cache = {
    quote = entry.quote,
    author = type(entry.author) == 'string' and entry.author or nil,
  }
  return quote_cache.quote, quote_cache.author
end

return {
  --enabled = false,
  'folke/snacks.nvim',
  dependencies = { 'rbereziuk/fav-quotes' },
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
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣞⣛⣛⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢿⣿⣿⣿⢓⣒⠒⢺⠟⡀⢀⠒⠀⠀⠀⠀⠀⠀⠀⣿𝖫౿𝗍'ડ ⣿⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠢⣹⣭⣿⣶⣭⣵⣿⢰⣬⣤⣾ ⠀⠀⠀⠀⠀⠀⣿ have ⣿⠀⠀⠀⠀⠀⠀⠀  
⠀⠀⠀⢸⠃⢹⣿⣿⣿⣿⣿⣿⣁⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿  fun?⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠑⠛⣿⣿⣿⣿⣿⣟⣛⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠱⠦⠤⣽⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢨⣙⡯⠿⡿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⢸⣿⣿⣿⣿⡟⢰⡄⡄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣀⠠⠚⠀⠇⣙⠿⠿⠿⠿⣠⡹⡄⠀⢙⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣬⣙⡣⠄⠀⢀⡸⢿⡇⣀⡌⢟⣣⣦⣤⣬⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⢠⣶⣯⣿⡎⠡⢦⣼⣿⡆⡓⢋⡜⣿⣿⣿⡟⢘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣼⢰⣿⣿⣿⠇⢸⡛⣻⣿⡇⡇⢸⢧⣿⣿⣿⡇⣾⣷                    
]],
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
        function(self)
          local quote, author = random_quote()
          if not quote then
            return nil
          end

          local width = math.max(20, (self.opts.width or 60) - 4)
          local text = { { table.concat(wrap_text(quote, width), '\n'), hl = 'footer' } }
          if author and author ~= '' then
            text[#text + 1] = { '\n— ' .. author, hl = 'special' }
          end

          return {
            align = 'center',
            padding = { 0, 2 },
            text = text,
          }
        end,
      },
    },
    indent = { enabled = true },
    -- scroll = {},
    --input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    --terminal = {},
    -- lazygit = {},

  },

  keys = {

    { '<leader>lg', function() Snacks.lazygit() end, desc = 'Lazygit' },
    -- Top Pickers & Explorer
    { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep' },
    --{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    -- find
    { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
    --{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- LSP
    { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
    --{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    --{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
