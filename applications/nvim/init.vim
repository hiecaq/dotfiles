if !has("nvim")
    set nocompatible              " be iMproved -- not needed for nvim
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Plug Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:plug_timeout = 300
call plug#begin('~/.config/nvim/plugged') " ### plugin list begins here
" User Interface
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" other functions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-slash'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-sneak'
if has("nvim")
    Plug '/usr/local/opt/fzf', { 'do' : './install --all' } | Plug 'junegunn/fzf.vim'
endif
" productivity
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'Quinoa42/MyUltiSnips'
if has("nvim")
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim'
    " Plug 'tweekmonster/deoplete-clang2'
endif
" C# setup
if has("nvim")
Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild', 'for' : 'cs' }
            \ | Plug 'tpope/vim-dispatch', { 'for' : 'cs' }
            \ | Plug 'dimixar/deoplete-omnisharp', { 'for' : 'cs' }
endif
" java
Plug 'artur-shaik/vim-javacomplete2', { 'for' : 'java' }
" python-jedi
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
" syntax
Plug 'vimperator/vimperator.vim'
Plug 'dogrover/vim-pentadactyl'
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }
Plug 'freitass/todo.txt-vim', { 'for' : 'todo' }
Plug 'lervag/vimtex', { 'for' : 'tex' }
call plug#end()   " ### Plug list ends here

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encodings setting
" set enc=utf-8  "done by neovim already
set fileencodings=utf-8,gbk,big5
" ignore cases in search
set ignorecase
" vim's default wild completion for commands
if !has("nvim")
    set wildmenu
endif
" enable 256 colors
set t_Co=256
if has("nvim")
    set termguicolors
endif
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" color theme
colorscheme NeoSolarized
" set background type
set background=dark

" always show status line
" set laststatus=2
" disable default mode indicator(have airline already)
set noshowmode
" show position of cursor
set ruler
" show relative line numbers (give up because of performance)
" set relativenumber
" show line numbers
set number

augroup number_highlights
    au!
    autocmd VimEnter,Colorscheme * :hi CursorLineNr  gui=bold guifg=#586e75 guibg=#073642
augroup END

" highlight the current line/column
"set cursorline
"set cursorcolumn
" search while typing patterns
" set incsearch
" highlight search results
" set hlsearch
" no line wrap
set nowrap
" enable syntax highlights
syntax enable
" allow to replace default syntax highlights with intended ones
syntax on
"" auto load plugin files for specific file types
filetype plugin on
" auto indent of file
filetype indent on
" disable fold
set nofoldenable
" replace tab with space
set expandtab
" numbers of space standed by tab while editing
set tabstop=4
" numbers of space standed by tab while formatting
set shiftwidth=4
" let vim consider contious spaces as tab
set softtabstop=4
" allow backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
" automatically go to the last line last time
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
endif " has("autocmd")


set previewheight=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Provider                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    let g:python_host_prog = $HOME . "/.pyenv/versions/neovim2/bin/python"
    let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim3/bin/python"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                KEY MAPPINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <Leader>
nnoremap <space> <Nop>
vnoremap <space> <Nop>
let mapleader="\<space>"
" alternative esc
"imap <D-space> <esc>   "using the function provided by iterm2 instead
vnoremap <esc> <esc><esc><esc>
"Fast reloading of the .vimrc
nmap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
nmap <silent> <leader>ee :e $MYVIMRC<cr>
" clear search pattern
" nmap <silent> <leader>CS :let @/ = ""<cr>
" nohlsearch
nmap <leader>// :nohlsearch<cr>
" alias
nnoremap <Leader>; :
vnoremap <Leader>; :
" copy selected block to the clipboard
vnoremap <Leader>y "+y
" copy to clipboard
noremap <Leader>y "+y
" copy a whole line to the clipboard
noremap <Leader>Y "+Y
" put the text from clipboard after the cursor
noremap <Leader>p "+p
" put the text from clipboard before the cursor
noremap <Leader>P "+P

" close the current window
nmap <Leader>q :q<CR>
" save the current window
nmap <Leader>w :w<CR>
" write & quit the current window
nmap <Leader>Q :wq<CR>
" quick match ()[]{}
nmap <Leader>m %
" spell-check toggle
nmap <Leader>SL :setlocal invspell spelllang=en_us<CR>
nmap <Leader>SA :spellr<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              PLUGINS SETTINGS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""
"  Airline  "
"""""""""""""
" use Powerline symbols(special fonts requried)
let g:airline_powerline_fonts = 1
" theme
let g:airline_theme='solarized'
" hide empty sections
let g:airline_skip_empty_sections = 1
" extension: Smarter tabline
let g:airline#extensions#tabline#enabled = 1
" extension for ale
let g:airline#extensions#ale#enabled = 0
"""""""""""""""""""
"  Indent Guides  "
"""""""""""""""""""

" start with vim
let g:indent_guides_enable_on_vim_startup=1
" exclude filetypes
let g:indent_guides_exclude_filetypes = ['help', 'man', 'fzf']
" show indent starts from 2 level
let g:indent_guides_start_level=2
" size
let g:indent_guides_guide_size=1

" manually set colors ( no longer needed thanks to nvim)
if !has("nvim")
    let g:indent_guides_auto_colors = 0
    augroup Indent_Guides_Initial
        au!
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=011
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=000
    augroup END
endif
""""""""""""""
"  NERDTree  "
""""""""""""""

" auto close NERDTree after open something
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
augroup NERD_TREE_SETTING
    au!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" toggle NERDTree
nmap <Leader>N :NERDTreeToggle<CR>

""""""""""""""""""
"  NERD_Comment  "
""""""""""""""""""

let NERDCommentEmptyLines=1 " also comment empty line
let NERDDefaultAlign='both' " align on left&right
let NERDCommentWholeLinesInVMode=1 "comment whole line in V-mode
let NERDSpaceDelims=1 " add extra space
let NERDCreateDefaultMappings=0 " disable default mapping
" ;cc --> comment toggle
map <Leader>cc <plug>NERDCommenterToggle
" ;c; --> comment at the end of this line
map <Leader>c; <plug>NERDCommenterAppend
" ;cy --> comment this line and copy
map <Leader>cy <plug>NERDCommenterYank
" ;cl --> comment from this position to end of the line
map <Leader>cl <plug>NERDCommenterToEOL
" ;cu --> uncomment
map <Leader>cu <plug>NERDCommenterUncomment
" ;cs --> commentSexy
map <Leader>cs <plug>NERDCommenterSexy
" ;ci --> invert comments
map <Leader>ci <plug>NERDCommenterInvert

"""""""""""""""
"  UltiSnips  "
"""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsListSnippets="<c-a>l"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-a><c-a>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/UltiSnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""
"  deoplete  "
""""""""""""""
if has("nvim")
    " enable deoplete
    let g:deoplete#enable_at_startup=1
    " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " even show when there is only one result
    set completeopt=longest,menuone
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#ignore_sources = {}
    let g:deoplete#omni#functions = {}
    " LaTeX
    let g:deoplete#omni#input_patterns.tex = '\\(?:'
                \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
                \ . '|hyperref\s*\[[^]]*'
                \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|\w*'
                \ .')'
    " java
    let g:deoplete#omni#input_patterns.java = [
        \'[^. \t0-9]\.\w*',
        \'[^. \t0-9]\->\w*',
        \'[^. \t0-9]\::\w*',
        \]
    let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
    let g:deoplete#ignore_sources._ = ['javacomplete2']
    let g:deoplete#omni#functions.java = [
      \ 'javacomplete#Complete'
    \]
endif

if has("patch-7.4.314")
      set shortmess+=c
endif

let g:echodoc_enable_at_startup=1
"""""""""""""""
"  OmniSharp  "
"""""""""""""""
if has("nvim")
    let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
endif

""""""""""""""""""""""
"  Goyo & Limelight  "
""""""""""""""""""""""

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    "set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    "set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

augroup Goyo_initialize
    au!
    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave nested call <SID>goyo_leave()
    autocmd User GoyoLeave Limelight!
augroup END

" Limelight solarized setting
let g:limelight_conceal_ctermfg = 030

" Goyo toggle
nmap <Leader>G :Goyo<CR>

"""""""""""
"  sneak  "
"""""""""""

let g:sneak#s_next=1 " clever-f-like s/S support
let g:sneak#label=1 " eazymotion-like s/S enhance
let g:sneak#f_reset=0 " continue to use ;, for sneak
let g:sneak#t_reset=0 " ^
let g:sneak#absolute_dir=1 " s; forwards only and S, backwards only

""""""""""""""
"  clever-f  "
""""""""""""""
let g:clever_f_across_no_line=1 " only match the current line
let g:clever_f_fix_key_direction=1 " fix f to forward and F backword, tT etc.
let g:clever_f_chars_match_any_signs=";" " use ; to match all signs
let g:clever_f_use_migemo=1 " enable migemo support

"""""""""""""""
"  vim-slash  "
"""""""""""""""

noremap <plug>(slash-after) zz

"""""""""
"  ale  "
"""""""""
let g:ale_lint_on_text_changed = 'never'

" Display Ale status in Airline
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥']
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
nmap <silent> <Leader>ek <Plug>(ale_previous_wrap)
nmap <silent> <Leader>ej <Plug>(ale_next_wrap)
let g:ale_linters = {
            \   'tex': ['chktex'],
            \   'c' : ['gcc'],
            \   'python' : ['flake8'],
            \}

let g:ale_fixers = {
            \   'python': [
            \       'yapf',
            \       'isort',
            \   ],
            \}


let g:ale_c_gcc_options = '-std=gnu99 -Wall'
" use flake8 installed at the virtualenv for neovim
let g:ale_python_flake8_executable = $HOME . "/.pyenv/versions/neovim3/bin/flake8"
let g:ale_python_flake8_use_global = 1
" use yapf installed at the virtualenv for neovim
let g:ale_python_yapf_executable = $HOME . "/.pyenv/versions/neovim3/bin/yapf"
let g:ale_python_yapf_use_global = 1
" use isort installed at the virtualenv for neovim
let g:ale_python_isort_executable = $HOME . "/.pyenv/versions/neovim3/bin/isort"
let g:ale_python_isort_use_global = 1
""""""""""""
"  vimtex  "
""""""""""""
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_use_temp_files = 1
let g:vimtex_quickfix_open_on_warning = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              SYNTAX SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""
"  Markdown  "
""""""""""""""
let g:vim_markdown_math = 1 " LaTeX support
let g:vim_markdown_frontmatter = 1 " YAML frontmatter for Jekyl
let g:vim_markdown_conceal = 0 " disable the conceal since it's tooooo ugly
augroup Markdown_Initial
    au!
    autocmd VimEnter *.tmp :set ft=markdown " set markdown for *.tmp called by vimperator
    " autocmd FileType markdown :setlocal wrap
    " autocmd FileType markdown :setlocal linebreak
    " autocmd FileType markdown :setlocal nonumber
    autocmd FileType markdown :SoftPencil
augroup END

""""""""""
"  YAML  "
""""""""""

augroup YAML_Tabs_Speical
    au!
    autocmd FileType yaml :setlocal tabstop=2
    autocmd FileType yaml :setlocal shiftwidth=2
    autocmd FileType yaml :setlocal softtabstop=2
augroup END

""""""""""""""
"  Todo.txt  "
""""""""""""""
highlight link TodoContext type
