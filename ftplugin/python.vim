if executable('ruff')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff',
        \ 'cmd': {server_info->['ruff', 'server', '--preview']},
        \ 'allowlist': ['python'],
        \ 'workspace_config': {},
        \ })

    function! s:on_lsp_buffer_enabled() abort
        let l:capabilities = lsp#get_server_capabilities('ruff')
        if !empty(l:capabilities)
            let l:capabilities.hoverProvider = v:false
        endif
    endfunction

    augroup lsp_install
        au!
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
endif
