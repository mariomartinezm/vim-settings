set nocompatible            " Forget about Vi

" Specify a directory for plugins
if has("win32") || has("win16")
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Github repos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'arcticicestudio/nord-vim'
Plug 'base16-project/base16-vim'
Plug 'beyondmarc/glsl.vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'logico/typewriter-vim'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'Marfisc/vorange'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Omnisharp/omnisharp-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tommcdo/vim-lion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'whatyouhide/vim-gotham'

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
    if has("win32") || has("win16")
        set gfn=Cascadia\ Code\ PL:h10:cANSI
    endif

    set guioptions-=m       " hide menu bar
    set guioptions-=T       " hide toolbar
    set guioptions-=L       " hide left hand scroll bar
    set guioptions-=r       " hide right hand scroll bar
    set guioptions-=e       " disable gui tabs
endif

colorscheme tokyonight
let g:tokyonight_style = "night"    " available, night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_disable_italic_comment = 1
let g:airline_theme = "tokyonight"


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
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" Leader key mappings
map <Leader>y "+y
map <Leader>p "+p
nnoremap <Leader>cw :cd %:p:h<CR>:pwd<CR>
map <Leader><Space> :nohlsearch<CR>

" Function key mappings
map <F4> :Explore<CR>
map <F5> :make!<CR>

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

if executable('pyls')
    "" pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

"let g:lsp_log_file = 'D:/lsp.log'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clangd']
\}

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Change the symbols ALE uses
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Run linteres only when saving a file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win16")
    let g:vimwiki_list = [
                \{'path': 'D:/Documents/Vimwiki'}
                \]
else
    let g:vimwiki_list = [
                \{'path': '~/Documents/Vimwiki'}
                \]
endif

:hi VimwikiHeader1 guifg=#F7768E
:hi VimwikiHeader2 guifg=#E0AF68
:hi VimwikiHeader3 guifg=#9ECE6A
:hi VimwikiHeader4 guifg=#73DACA
:hi VimwikiHeader5 guifg=#B4F9F8
:hi VimwikiHeader6 guifg=#7AA2F7

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
