nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

noremap <silent><leader>o :lua require('me').only()<CR>
nnoremap <bs> <c-^>

" pre-filter history navigation in command-mode with already typed input
cnoremap <c-n> <down>
cnoremap <c-p> <up>

xmap gl <Plug>(EasyAlign)

nnoremap gf gfzv
nnoremap gF gFzv

nnoremap L Lzz
nnoremap H Hzz

" snippets
imap <C-j> <cmd>lua U.reload('me.snippet').maybe()<CR>

imap <expr> <Tab>   luasnip#jumpable(1)  ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <expr> <Tab>   luasnip#jumpable(1)  ? '<Plug>luasnip-jump-next' : '<Tab>'
imap <expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'


" split navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nnoremap <silent> <c-w>s :lua require('me.win').split()<CR>
nnoremap <silent> <c-w>v :lua require('me.win').vsplit()<CR>
nnoremap <silent> <c-w>] :lua require('me.win').goto_def()<CR>


" :terminal stuff

tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l

" tn -> terminal new
" te -> terminal execute
" ts -> terminal send
nnoremap <silent><leader>tn :lua require('term').toggle()<CR>
nnoremap <silent><leader>te :w<CR> :lua require('term').run()<CR>
nnoremap <silent><leader>ts :lua require('term').sendLine(vim.fn.getline('.'))<CR>
vnoremap <silent><leader>ts <ESC>:lua require('term').sendSelection()<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

augroup outline
  autocmd! FileType python,java,lua,haskell,yaml nnoremap <buffer><silent>gO :Vista!!<CR>
augroup end


" gnupg
nnoremap <leader>pe :GPGEditRecipients<cr>
nnoremap <leader>pv :GPGViewRecipients<cr>

" fugitive {{{

nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gc :Git commit -v<cr>

" }}}


" vim-test 
nmap <silent> t<C-n> :w <BAR> TestNearest<CR>
nmap <silent> t<C-f> :w <BAR> TestFile<CR>
nmap <silent> t<C-s> :w <BAR> TestSuite --verbose<CR>
nmap <silent> t<C-l> :w <BAR> TestLast<CR>
nmap <silent> t<C-g> :w <BAR> TestVisit<CR>


" for :R digraphs
func! ReadExCommandOutput(newbuf, cmd) abort
  redir => l:message
  silent! execute a:cmd
  redir END
  if a:newbuf | wincmd n | endif
  silent put=l:message
endf
command! -nargs=+ -bang -complete=command R call ReadExCommandOutput(<bang>0, <q-args>)

command -nargs=0 LspErrors :lua vim.diagnostic.setqflist { severity = vim.diagnostic.severity.ERROR }
command -nargs=0 LspWarnings :lua vim.diagnostic.setqflist { severity = vim.diagnostic.severity.WARN }
command -nargs=0 LspRestart :lua require('me.lsp.conf').restart()

nnoremap <silent> <leader>q :lua require('quickfix').toggle()<CR>

nnoremap <silent> <leader>h :lua require('hop').hint_words()<CR>
nnoremap <silent> <leader>/ :HopPattern<CR>
vnoremap <silent> <leader>h :lua require('hop').hint_words()<CR>
omap     <silent> h :HopWord<CR>
omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>

nnoremap <space> <cmd>lua vim.diagnostic.open_float(0, { border = 'single' })<CR>
nnoremap ]w <cmd>lua vim.diagnostic.goto_next{ float = { border = 'single' }}<CR>
nnoremap [w <cmd>lua vim.diagnostic.goto_prev{ float = { border = 'single' }}<CR>

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" common Go commands
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0,1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>e <Plug>(go-rename)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>s <Plug>(go-implements)
" go navigation commands
autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
" go alternate command (corresponding test file)
autocmd FileType go nmap <leader>ae <Plug>(go-alternate-edit)
autocmd FileType go nmap <leader>av <Plug>(go-alternate-vertical)
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
