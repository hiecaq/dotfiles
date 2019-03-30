" before-hook for markdown
" FileType: markdown

let g:vim_markdown_math = 1 " LaTeX support
let g:vim_markdown_toml_frontmatter = 1 " TOML frontmatter
" let g:vim_markdown_conceal = 0 " disable the conceal since it's tooooo ugly


if bufname("%") ==# "__LanguageClient__"
    setlocal conceallevel=2
    setlocal concealcursor=niv
endif
