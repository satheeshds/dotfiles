vim.cmd [[
  source ~/.config/nvim/options.vim
  source ~/.config/nvim/mappings.vim
  source ~/.config/nvim/plugin_options.vim
]]

vim.g.python3_host_prog = vim.fn.expand('$HOME/.virtualenvs/nvim/bin/python')

local accept_compl_or_cr = function()
  return require('lsp_compl').accept_pum() and '<c-y>' or '<CR>'
end

require('me.fzy').setup()


vim.o.scrollback=100000
