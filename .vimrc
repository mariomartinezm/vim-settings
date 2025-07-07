set nocompatible            " Forget about Vi

if has("win32") || has("win16")
    " Specify a directory for plugins
    call plug#begin('~/vimfiles/plugged')

    " Specify a directory for user snippets
    let g:neosnippet#snippets_directory = "~/vimfiles/mysnippets"
else
    call plug#begin('~/.vim/plugged')
    let g:neosnippet#snippets_directory = "~/.vim/mysnippets"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Github repos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'base16-project/base16-vim'
Plug 'beyondmarc/glsl.vim'
Plug 'Dimercel/todo-vim'
Plug 'Donaldttt/fuzzyy'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'ledger/vim-ledger'
Plug 'logico/typewriter-vim'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'nordtheme/vim', {'as':'nord'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'Omnisharp/omnisharp-vim'
Plug 'sainnhe/edge'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'tommcdo/vim-lion'
Plug 'uiiaoo/java-syntax.vim', { 'for': 'java' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vimwiki/vimwiki'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Display settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                  " show line numbers
set showmatch               " show matching bracket (briefly jump)
set showmode                " show mode in status bar
set showcmd                 " show typed command in status bar
set ruler                   " show cursor position in status bar
set title                   " show file title in title bar
syntax on                   " Highlight syntax
set hlsearch                " highlight search results
set belloff=all             " Disable bell sounds

if &term =~ '256color'
    set t_ut=               " disable Background Color Erase (BCE) so
                            " that color schemes render properly when
                            " inside 256-color tmus and GNU screen
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Set Vim-specific sequences for
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " RGB colors
set t_Co=256                            " Enable 256 colors
set termguicolors                       " true color support

if has("gui_running")
    set gfn=Maple\ Mono\ 13

    set guioptions-=m       " hide menu bar
    set guioptions-=T       " hide toolbar
    set guioptions-=L       " hide left hand scroll bar
    set guioptions-=r       " hide right hand scroll bar
    set guioptions-=e       " disable gui tabs
endif

let g:airline_theme = "edge"
let g:edge_style = "aura"
let g:edge_better_performance = 1
colorscheme edge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start " sane backspace defaults
set encoding=utf-8          " set utf-8 as default encoding
set noundofile              " do not create undo files
set nowrap                  " don't wrap lines
set ignorecase              " first enable ignore case for searching
set smartcase               " then enable smart case (case-sensitive if you use
                            " uppercase characters)
set smartindent             " smart auto indenting
set smarttab                " smart tab handling for indenting
set expandtab               " convert tab to spaces
set tabstop=4               " number of spaces a tab counts for
set shiftwidth=4            " spaces for autoindent
filetype plugin indent on   " enable plugins

set splitbelow              " Open horizontal splits below
set splitright              " Open vertical splits to the right
set sessionoptions=curdir,buffers,tabpages

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <Esc>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Leader key mappings
map <Leader>y "+y
map <Leader>p "+p
nnoremap <Leader>cw :cd %:p:h<CR>:pwd<CR>
map <Leader><Space> :nohlsearch<CR>

" Function key mappings
nnoremap <F2> :let @+=expand("%:p")<CR>
map <F4> :Explore<CR>
map <F5> :make!<CR>

" LSP mappings
map <Leader>df :LspDocumentFormat<CR>
map <Leader>rf :LspDocumentRangeFormat<CR>
map <Leader>ac :LspCodeAction<CR>
map <Leader>re :LspRename<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => asyncomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-k>      <Plug>(neosnippet_expand_or_jump)
smap <C-k>      <Plug>(neosnippet_expand_or_jump)
xmap <C-k>      <Plug>(neosnippet_expand_or_jump)

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 100
let g:lsp_diagnostics_virtual_text_enabled = 0
"let g:lsp_log_file = 'D:/lsp.log'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win16")
    let g:vimwiki_list = [{
                \ 'path': 'D:/Documents/Vimwiki',
                \ 'syntax': 'markdown',
                \ 'ext': '.md'
                \}]
else
    let g:vimwiki_list = [{
                \ 'path': '~/Documents/Vimwiki',
                \ 'syntax': 'markdown',
                \ 'ext': '.md'
                \}]
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tb :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-lion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:lion_squeeze_spaces = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => todo-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>td :TODOOpen<CR>
let g:todo_vertical = 1
let g:todo_right = 1
let g:todo_winwidth = 40
