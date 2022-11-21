let g:vsnip_snippet_dir = expand('~/.config/vsnip/')
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:gist_detect_filetype = 1
let g:gist_browser_command = 'echo %URL% | xclip'

" Enable syntax highlighting in fenced code blocks
let g:markdown_fenced_languages = ['python', 'html', 'javascript', 'css', 'bash=sh', 'sh']

let test#strategy = "neovim"

if executable('hasktags')
  let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
endif

let g:vista_executive_for = {
  \ 'haskell': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ 'java': 'nvim_lsp',
  \ 'yaml': 'nvim_lsp',
  \ 'yaml.ansible': 'nvim_lsp',
  \ }

" tree-view
let g:netrw_liststyle = 3

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
" Use new popup windows for Go Doc
let g:go_doc_popup_window = 1
let g:deoplete#enable_at_startup = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
