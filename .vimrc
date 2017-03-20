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
Plug 'altercation/vim-colors-solarized'
Plug 'beyondmarc/glsl.vim'
Plug 'bling/vim-airline'
Plug 'liuchengxu/space-vim-dark'
Plug 'Marfisc/vorange'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'reedes/vim-colors-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'whatyouhide/vim-gotham'
Plug 'zeis/vim-kolor'
Plug 'zcodes/vim-colors-basic'

call plug#end()

"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'scrooloose/syntastic'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'vim-scripts/taglist.vim'

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
set guioptions-=L           " hide left hand scroll bar

if has("gui_running")
    if has("win32") || has("win16")
        set gfn=Consolas:h10:cANSI
    endif

    colorscheme space-vim-dark
else
    colorscheme vorange
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd  %:p:h                   " Change to directory of current file
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <Esc>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <Leader>y "+y
map <Leader>p "+p
nnoremap <Leader>cw :cd %:p:h<CR>:pwd<CR>

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
" => Neosnippet settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>uf :<C-u>Unite file<CR>
"nnoremap <leader>un :<C-u>Unite file file/new<CR>
"nnoremap <leader>ub :<C-u>Unite buffer<CR>
"nnoremap <leader>ur :<C-u>Unite file_rec<CR>

"" Custom mappings for the unite buffer
"function! s:unite_settings()
    "nmap <buffer> <Esc> <Plug>(unite_exit)
"endfunction

"autocmd FileType unite call s:unite_settings()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:jedi#popup_select_first = 0
let g:jedi#rename_command = "<leader>R"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win16")
    let g:vimwiki_list = [
                \{'path': 'D:/Dropbox/TODO/personal.wiki'}
                \]
else
    let g:vimwiki_list = [
                \{'path': '~/Dropbox/TODO/personal.wiki'}
                \]
endif
