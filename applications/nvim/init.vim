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
""""""""""""""""""""
"  User Interface  "
""""""""""""""""""""
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
            \| Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
" if has("nvim")
"     Plug '/usr/local/opt/fzf', { 'do' : './install --all' } | Plug 'junegunn/fzf.vim'
" endif
" Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
            \ | Plug 'chemzqm/unite-location'
if executable('eclimd')
    Plug '~/.config/eclim' , { 'for' : 'java' }
endif
Plug 'luochen1990/rainbow', { 'for' : ['json', 'racket'] }
" Plug 'edkolev/tmuxline.vim'

""""""""""""""""""""""""""""""""
"  text objects and operators  "
""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-textobj-user'
            \ | Plug 'Julian/vim-textobj-variable-segment'
            \ | Plug 'sgur/vim-textobj-parameter'
            \ | Plug 'kana/vim-textobj-entire'
            \ | Plug 'glts/vim-textobj-comment'
            \ | Plug 'kana/vim-textobj-function', { 'for' : ['C', 'java', 'vimscript'] }
            \ | Plug 'bps/vim-textobj-python', { 'for' : 'python' }
Plug 'kana/vim-operator-user'
            \ | Plug 'kana/vim-operator-replace'
"""""""""""""""""""""""""
"  functions and tools  "
"""""""""""""""""""""""""
if executable('tmux')
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/tmux-complete.vim'
endif
if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-sneak'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
"""""""""""""""""
"  enhancement  "
"""""""""""""""""
Plug 'junegunn/vim-slash'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'quinoa42/MyUltiSnips'
Plug 'w0rp/ale'
" Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
if executable('clang')
    Plug 'tweekmonster/deoplete-clang2', { 'for' : ['c', 'cpp'] }
endif
Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild', 'for' : 'cs' }
            \ | Plug 'tpope/vim-dispatch', { 'for' : 'cs' }
            \ | Plug 'dimixar/deoplete-omnisharp', { 'for' : 'cs' }
Plug 'artur-shaik/vim-javacomplete2', { 'for' : 'java' }
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
" Plug 'Shougo/deoplete-rct', { 'for' : 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for' : 'ruby' }
Plug 'Shougo/neco-vim', { 'for' : 'vim' }
if executable('editorconfig')
    Plug 'editorconfig/editorconfig-vim'
endif
""""""""""""""""""""""""
"  language specifics  "
""""""""""""""""""""""""
Plug 'vimperator/vimperator.vim'
Plug 'dogrover/vim-pentadactyl'
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }
Plug 'freitass/todo.txt-vim', { 'for' : 'todo' }
Plug 'lervag/vimtex'
Plug 'Vimjas/vim-python-pep8-indent', { 'for' : 'python' }
Plug 'raimon49/requirements.txt.vim', { 'for' : 'requirements' }
Plug 'tmux-plugins/vim-tmux', { 'for' : 'tmux' }
Plug 'andreshazard/vim-logreview', { 'for' : 'logreview' }
Plug 'javier-lopez/sml.vim', { 'for' : 'sml' }
" Plug 'jez/vim-better-sml', { 'for' : 'sml' }
Plug 'tbastos/vim-lua', { 'for' : 'lua' }
Plug 'wlangstroth/vim-racket'
Plug 'tmux-plugins/vim-tmux'

call plug#end()   " ### Plug list ends here

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encodings setting
" set enc=utf-8  "done by neovim already
set fileencodings=utf-8,gbk,big5
" ignore cases in search
set ignorecase
" ignore cases in commandline for files
set wildignorecase
" vim's default wild completion for commands
if !has("nvim")
    set wildmenu
endif
" enable 256 colors
set t_Co=256
if has("termguicolors")
    set termguicolors
endif

if !has("nvim")
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
endif

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

" augroup number_highlights
"     au!
"     autocmd VimEnter,Colorscheme * :hi CursorLineNr  gui=bold guifg=#586e75 guibg=#073642
" augroup END

" highlight the current line/column
" set cursorline
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
" no annoying message when editing via scp
let g:netrw_silent=1
" automatically go to the line last time
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
endif " has("autocmd")


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
" prevent normal mode operator x from polluting the registers
nnoremap x "_x
" alias
vnoremap <Leader>; :
nnoremap <Leader>; :
" copy to clipboard
noremap <Leader>y "+y
" copy a whole line to the clipboard
noremap <Leader>Y "+Y
" put the text from clipboard after the cursor
noremap <Leader>p "+p
" put the text from clipboard before the cursor
noremap <Leader>P "+P
" put the text with auto re-indent
noremap <Leader>[p "+[p

" close the current window
nmap <Leader>q :q<CR>
" save the current window
nmap <Leader>w :w<CR>
" write & quit the current window
nmap <Leader>Q :wq<CR>
" spell-check toggle
" nmap <Leader>SL :setlocal invspell spelllang=en_us<CR>
" nmap <Leader>SA :spellr<CR>
" quick add empty lines
nnoremap <silent> <Leader>O  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <silent> <Leader>o  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              PLUGINS SETTINGS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_matchit = 1
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
" let airline#extensions#ale#error_symbol = 'E:'
" let airline#extensions#ale#warning_symbol = 'W:'
" extension for tagbar
let g:airline#extensions#tagbar#enabled = 0

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

""""""""""""
"  tagbar  "
""""""""""""
let g:tagbar_compact = 1
" toggle tagbar
nnoremap <silent> <Leader>T :<C-u>TagbarToggle<CR>

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
nmap <silent> <Leader>N :<C-u>NERDTreeToggle<CR>

""""""""""""
"  Denite  "
""""""""""""

" Change mappings.
call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

" Change sorters.
call denite#custom#source(
            \ '_', 'sorters', ['sorter_sublime'])

" Change file_rec command.
call denite#custom#var('file_rec', 'command',
            \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
            \ ['--smart-case', '--vimgrep', '-U'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" history
call denite#custom#var('command_history', 'ignore_command_regexp', ['^[A-Za-z]+$'])

" Change default prompt
call denite#custom#option('_', {
            \ 'prompt': '>',
            \ 'winheight': 16,
            \ 'vertical_preview': 1
            \ })

nnoremap <silent> <Leader><space>  :<C-u>Denite -resume<CR>
nnoremap <silent> <Leader>j :call execute('Denite -resume -select=+'.v:count1.' -immediately')<CR>
nnoremap <silent> <Leader>k :call execute('Denite -resume -select=-'.v:count1.' -immediately')<CR>
nnoremap <silent> <Leader>df :<C-u>Denite file_rec<CR>
nnoremap <silent> <Leader>dj :<C-u>Denite jump<CR>
nnoremap <silent> <Leader>dt :<C-u>Denite tag<CR>
nnoremap <silent> <Leader>dg :<C-u>Denite grep<CR>
nnoremap <silent> <Leader>dd :<C-u>Denite line<CR>
nnoremap <silent> <Leader>db :<C-u>Denite buffer<CR>
nnoremap <silent> <Leader>dc :<C-u>Denite command<CR>
nnoremap <silent> <Leader>dH :<C-u>Denite command_history<CR>
nnoremap <silent> <Leader>dh :<C-u>Denite help<CR>
nnoremap <silent> <Leader>do :<C-u>Denite outline<CR>
nnoremap <silent> <Leader>dr :<C-u>Denite register<CR>
nnoremap <silent> <Leader>dl :<C-u>Denite location_list<CR>
nnoremap <silent> <Leader>dq :<C-u>Denite quickfix<CR>

""""""""""""""""""
"  NERD_Comment  "
""""""""""""""""""
let NERDCommentEmptyLines=1 " also comment empty line
let NERDDefaultAlign='both' " align on left&right
let NERDCommentWholeLinesInVMode=1 " comment whole line in V-mode
let NERDSpaceDelims=1 " add extra space
let NERDCreateDefaultMappings=0 " disable default mapping
let NERDTrimTrailingWhitespace=1
" ;cc --> comment toggle
map <Leader>cc <plug>NERDCommenterToggle
" ;c; --> comment at the end of this line
map <Leader>c; <plug>NERDCommenterAppend
" ;cy --> comment this line and copy
map <Leader>cy <plug>NERDCommenterYank
" ;cl --> comment from this position to end of the line
map <Leader>c$ <plug>NERDCommenterToEOL
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
" python
let g:ultisnips_python_style="sphinx"

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
    let g:deoplete#ignore_sources._ = ['buffer', 'javacomplete2']
    let g:deoplete#omni#functions = {}
    " LaTeX
    let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
    " java
    let g:deoplete#omni#input_patterns.java = [
                \'[^. \t0-9]\.\w*',
                \'[^. \t0-9]\->\w*',
                \'[^. \t0-9]\::\w*',
                \]
    let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
    " let g:deoplete#omni#functions.java = ['javacomplete#Complete']
    " let g:deoplete#omni#functions.ruby = ['rubycomplete#Complete']
    " let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
endif

if has("patch-7.4.314")
    set shortmess+=c
endif

let g:echodoc_enable_at_startup=1

" let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('jedi', 'debug_enabled', 1)

"""""""""""
"  Eclim  "
"""""""""""

function! Java_autocomplete()
    if eclim#project#util#GetCurrentProjectName() == ''
        let b:deoplete_omni_functions = [
                    \ 'javacomplete#Complete'
                    \]
    else
        let b:deoplete_omni_functions = [
                    \ 'eclim#java#complete#CodeComplete'
                    \]
    endif
endfunction

augroup Java_deoplete
    au!
    autocmd FileType java call Java_autocomplete()
augroup END

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

""""""""""""""""""""
"  vim-grammarous  "
""""""""""""""""""""
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0,
            \ }

if executable('languagetool')
    let g:grammarous#languagetool_cmd = 'languagetool'
endif
" let g:grammarous#show_first_error=1

"""""""""""
"  sneak  "
"""""""""""
let g:sneak#s_next = 1 " clever-f-like s/S support
let g:sneak#label = 1 " eazymotion-like s/S enhance
let g:sneak#f_reset = 0 " continue to use ;, for sneak
let g:sneak#t_reset = 0 " ^
let g:sneak#absolute_dir = 1 " s; forwards only and S, backwards only

augroup Sneak_color
    au!
    autocmd VimEnter,ColorScheme * :hi Sneak guifg=black ctermfg=black guibg=#FFE53D ctermbg=003
augroup END

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

"""""""""""""""
"  gutentags  "
"""""""""""""""
let g:gutentags_resolve_symlinks = 1
let g:gutentags_ctags_exclude=['*.txt', '*.md', '*.rst', '*.json', 'Makefile', '*.ini', '*.yaml', '*.xml']
let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
            \ }

"""""""""
"  ale  "
"""""""""
let g:ale_lint_on_text_changed = 'never'

" Display Ale status in Airline
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✔']
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
nmap <silent> <Leader>ek <Plug>(ale_previous_wrap)
nmap <silent> <Leader>ej <Plug>(ale_next_wrap)
let g:ale_linters = {
            \   'tex': ['chktex'],
            \   'c' : ['gcc'],
            \   'python' : ['flake8'],
            \   'ruby' : ['rubocop', 'ruby'],
            \}

let g:ale_fixers = {
            \   'python': [
            \       'yapf',
            \       'isort',
            \   ],
            \}

let g:ale_c_gcc_options = '-std=gnu99 -Wall'

" let g:ale_java_javac_classpath = $HOME . "/path-to/lib/*:"
"             \ . $HOME . "/path-to/bin/*"
" let g:ale_java_javac_options = "-sourcepath " . $HOME . "/path-to/src"
" let g:ale_java_checkstyle_options = '-c ' . $HOME . '/.dotfiles/tools/checkstyle/google_checks.xml'
" use flake8 installed at the virtualenv for neovim
let g:ale_python_flake8_executable = $HOME . "/.pyenv/versions/neovim3/bin/flake8"
let g:ale_python_flake8_use_global = 1
" use yapf installed at the virtualenv for neovim
let g:ale_python_yapf_executable = $HOME . "/.pyenv/versions/neovim3/bin/yapf"
let g:ale_python_yapf_use_global = 1
" use isort installed at the virtualenv for neovim
let g:ale_python_isort_executable = $HOME . "/.pyenv/versions/neovim3/bin/isort"
let g:ale_python_isort_use_global = 1

noremap <Leader>A :<C-u>ALEFix<CR>

""""""""""""""""""""""
"  operator-replace  "
""""""""""""""""""""""

map _ <Plug>(operator-replace)

"""""""""""""""""""""
"  textobj-comment  "
"""""""""""""""""""""
let g:textobj_comment_no_default_key_mappings = 1

xmap a? <Plug>(textobj-comment-a)
omap a? <Plug>(textobj-comment-a)
xmap a/ <Plug>(textobj-comment-big-a)
omap a/ <Plug>(textobj-comment-big-a)
xmap i/ <Plug>(textobj-comment-i)
omap i/ <Plug>(textobj-comment-i)

""""""""""""
"  vimtex  "
""""""""""""
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_use_temp_files = 1
let g:vimtex_quickfix_open_on_warning = 0

"""""""""""""""""""""""""
"  Rainbow Parentheses  "
"""""""""""""""""""""""""

let g:rainbow_active = 1

let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'seagreen4', 'firebrick3', 'darkorange3'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold'],
            \	'separately': {
            \		'*': 0,
            \		'racket': {},
            \       'json' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']}
            \	}
            \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              SYNTAX SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""
"  Markdown  "
""""""""""""""
let g:vim_markdown_math = 1 " LaTeX support
let g:vim_markdown_frontmatter = 1 " YAML frontmatter for Jekyl
let g:vim_markdown_conceal = 0 " disable the conceal since it's tooooo ugly
let g:tex_conceal = ""

augroup Markdown_Initial
    au!
    autocmd VimEnter *.tmp :set ft=markdown " set markdown for *.tmp called by vimperator
    autocmd FileType markdown :SoftPencil
augroup END

""""""""""""""
"  Todo.txt  "
""""""""""""""
highlight link TodoContext type
