" Call ctags on current directory, ignore .git and build directories
map <Leader>tg :!ctags -R --exclude=.git --exclude=build .<CR>

" Align function arguments with parenthesis
set cino+=(0
