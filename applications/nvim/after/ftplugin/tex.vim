" after-hook for tex
" FileType: tex

call composition#sane()

let g:tex_flavor = 'latex'

if has('python3')
    call deoplete#custom#var('omni', 'input_patterns', {
                \ 'tex': g:vimtex#re#deoplete
                \})
    nnoremap <silent> <Leader>do :<C-u>Denite vimtex<CR>
endif

" setlocal conceallevel=1
" setlocal concealcursor="nv"
