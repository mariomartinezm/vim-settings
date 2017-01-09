"" Call ctags on current directory, ignore git and fuild directories
map <Leader>tg :!ctags -R --exclude=.git --exclude=build .<CR>
