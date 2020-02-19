" Call ctags on current directory, ignore .git and build directories
map <Leader>tg :!ctags -R --exclude=.git --exclude=build .<CR>

" Align function arguments with parenthesis
set cino+=(0

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ['-ID:/Documents/C++/OpenGL/DependenciesMinGW/include/', '-Iinclude/']
