local M = {}

local function format_bufname(bufnr)
  local uri = vim.uri_from_bufnr(bufnr)
  return require('me').format_uri(uri)
end


local function emoji()
  local lines = {}
  for line in io.lines(os.getenv('HOME') .. '/.config/dm/emoji.json') do
    table.insert(lines, line)
  end
  local items = vim.json.decode(table.concat(lines, '\n'))
  local opts = {
    prompt = 'Emoji> ',
    format_item = function(item) return item.emoji .. ' ' .. item.description end,
  }
  vim.ui.select(items, opts, function(item)
    if item then
      vim.api.nvim_feedkeys('a' .. item.emoji, 'n', true)
    end
  end)
end


function M.setup()
  local fzy = require('fzy')
  fzy.format_bufname = format_bufname
  fzy.setup()
  return fzy
end


return M
