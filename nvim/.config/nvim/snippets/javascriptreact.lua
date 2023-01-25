local ls = require('luasnip') --- {{{
local s = ls.s  --> snippet
local i = ls.i  --> insert node
local t = ls.t  --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {}, {} 
--- }}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.js"

local us = s('us', {
  t('const ['),
  i(1, 'state'),
  t(', '),
  d(2, function(arg, _)
    return sn(1, i(1, 'set' .. arg[1][1]:sub(1,1):upper()..arg[1][1]:sub(2)))
  end, 1),
  t('] = useState('),
  i(3, ''),
  t(')'),
})

table.insert(snippets, us)

return snippets, autosnippets
