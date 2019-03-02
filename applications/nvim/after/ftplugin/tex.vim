" after-hook for tex
" FileType: tex

call composition#sane()

if has('python3')
    call deoplete#custom#var('omni', 'input_patterns', {
                \ 'tex': g:vimtex#re#deoplete
                \})
endif
