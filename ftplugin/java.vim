" Set maven as make program
set makeprg=mvn\ compile

" Format the entire source file
map <F3> :LspDocumentFormat<CR>

" Test
map <F6> :!mvn test<CR>

" Package
map <F7> :!mvn package<CR>
