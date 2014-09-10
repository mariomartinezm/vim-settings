if has('vim_starting')
    set nocompatible

    if has("win32") || has("win16")
        source $VIMRUNTIME/vimrc_example.vim
        source $VIMRUNTIME/mswin.vim
        behave mswin
        set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim/
    else
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
endif

if has("win32") || has("win16")
    call neobundle#rc(expand('C:/Vim/vimfiles/bundle/'))
else
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Let neobundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Github repos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'yegappan/mru'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'klen/python-mode'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'pydave/AsyncCommand'
NeoBundle 'zeis/vim-kolor'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'reedes/vim-colors-pencil'

NeoBundleCheck              " Installation check

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
set colorcolumn=80          " show a margin at column 80
set hlsearch                " highlight search results

if has("gui_running")
    if has("win32") || has("win16")
        set gfn=Consolas:h9:cANSI
    endif

    colorscheme pencil
else
  colorscheme default
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8          " set utf-8 as default encoding
set nowrap                  " don't wrap lines
set ignorecase              " first enable ignore case for searching
set smartcase               " then enable smart case (case-sensitive if you use
                            " uppercase characters)
set smartindent             " smart auto indenting
set smarttab                " smart tab handling for indenting
set expandtab               " convert tab to spaces
set tabstop=4               " number of spaces a tab counts for
set shiftwidth=4            " spaces for autoindent
set autochdir               " set working directory to current file
filetype plugin indent on   " enable plugins

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <Esc>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <Leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neocomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neosnippet settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-k>      <Plug>(neosnippet_expand_or_jump)
smap <C-k>      <Plug>(neosnippet_expand_or_jump)
xmap <C-k>      <Plug>(neosnippet_expand_or_jump)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope = 0       " Disable all rope functionality

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0
let g:jedi#rename_command = "<leader>R"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings for vsvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
