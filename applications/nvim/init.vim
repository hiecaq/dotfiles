" GENERAL {{{
if !has("nvim")
    set nocompatible              " be iMproved -- not needed for nvim
    set enc=utf-8
endif

set fileencodings=utf-8,gbk,big5,euc-jp
" ignore cases in search
set ignorecase
" ignore cases in commandline for files
set wildignorecase
" vim's default wild completion for commands
set wildmenu

" enable 256 colors
if has("termguicolors") && expand("$COLORTERM") ==# "truecolor"
    set termguicolors
    if !has("nvim")
        set t_Co=256
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
    endif
endif

" colorschemes
colorscheme gruvbox

" set background type
set background=dark
" disable default mode indicator(have airline already)
set noshowmode
" show position of cursor
set ruler
" don't show relative line numbers
set norelativenumber
" show line numbers
set number
" no line wrap
set nowrap
" auto load plugin files for specific file types
filetype plugin indent on
" allow to replace default syntax highlights with intended ones
syntax enable
" enable breakindent
if exists("+breakindent")
    set breakindent
    set breakindentopt=shift:0
endif
" disable fold
set nofoldenable
" neovim 0.4.0+: transparent popup-menu
if exists('&pumblend')
    set pumblend=20
endif
" neovim 0.4.0+: transparent floating windows
if exists('&winblend')
    set winblend=20
endif
" auto break new lines on textwidth
let g:quinoa42_textwidth=79
let &textwidth=g:quinoa42_textwidth
let g:man_hardwrap=1
" replace tab with space
set expandtab
" numbers of space standed by tab while editing
set tabstop=4
" numbers of space standed by tab while formatting
set shiftwidth=4
" let vim consider contious spaces as tab
set softtabstop=4
" stop at the last matching, don't restart at the beginning
set nowrapscan
" round indent to 'shiftwidth' when using > and <
set shiftround
" allow backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
" no annoying message when editing via scp
let g:netrw_silent=1
" diff opts
if &diffopt =~ 'internal'
    set diffopt+=indent-heuristic,algorithm:patience
endif

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
" GENERAL END }}}

" KEY MAPPINGS {{{
" set <Leader>
nnoremap <space> <Nop>
vnoremap <space> <Nop>
let mapleader="\<space>"
vnoremap <esc> <esc><esc><esc>
"Fast reloading .vimrc
nmap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing .vimrc
nmap <silent> <leader>ee :tabe $MYVIMRC<cr>
" clear search pattern
" nmap <silent> <leader>CS :let @/ = ""<cr>
" nohlsearch
nmap <leader>// :nohlsearch<cr>
" neovim 0.2.3+: show replace results on the fly
if exists('&inccommand')
    set inccommand=split
endif
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
" close preview window
nmap Q <c-w><c-z>
" spell-check toggle
nmap <Leader>sp :setlocal invspell spelllang=en_us<CR>
nmap <Leader>sA :spellr<CR>
" quick add empty lines
nnoremap <silent> <Leader>O  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <silent> <Leader>o  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" make the previous word uppercase
inoremap <silent> <c-a><c-u> <esc>gUawea
" KEY MAPPINGS END }}}

" PROVIDER {{{
if has("nvim") && executable("pyenv")
    let g:python_host_prog = $HOME . "/.pyenv/versions/neovim2/bin/python"
    let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim3/bin/python"
endif
" PROVIDER END }}}

" PLUGINS SETTINGS {{{1

" Proj {{{2
if has("nvim") && has("python3")
    packadd! proj.nvim
    call proj#markers#set({
                \ '_': ['.git', 'README.md', '.editorconfig', 'Makefile'],
                \ 'rust': ['Cargo.toml'],
                \ })
endif
" Proj END }}}2

" Airline {{{2
" use Powerline symbols(special fonts requried)
let g:airline_powerline_fonts = 1
" theme
packadd! gruvbox
let g:airline_theme='gruvbox'
" hide empty sections
let g:airline_skip_empty_sections = 1
" extension: Smarter tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
" extension for ale
" let g:airline#extensions#ale#enabled = 1
" let airline#extensions#ale#error_symbol = 'E:'
" let airline#extensions#ale#warning_symbol = 'W:'
" extension for tagbar
let g:airline#extensions#tagbar#enabled = 0
let g:airline_focuslost_inactive=1
let g:airline_detect_modified=1
" Airline END }}}2

" Indent Guides {{{2
" start with vim
let g:indent_guides_enable_on_vim_startup=1
" exclude filetypes
let g:indent_guides_exclude_filetypes = ['help', 'man', 'fzf', 'defx']
" show indent starts from 2 level
let g:indent_guides_start_level=2
" size
let g:indent_guides_guide_size=1

" manually set colors ( no longer needed thanks to nvim)
if !has("nvim") && has("autocmd") && &termguicolors
    let g:indent_guides_auto_colors = 0
    augroup Indent_Guides_Initial
        au!
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=011
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=000
    augroup END
endif
" Indent Guides }}}2

" Neosnippet {{{2
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-F> <Plug>(neosnippet_expand_or_jump)
smap <C-F> <Plug>(neosnippet_expand_or_jump)
xmap <C-F> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility=1
" let g:neosnippet#disable_runtime_snippets= {
"            \ '_': 1,
"            \ }
let g:neosnippet#enable_completed_snippet=1
let g:neosnippet#enable_optional_arguments=&filetype ==# "python" ? 1 : 0

" Neosnippet END }}}2

" Defx  {{{2
if has ("nvim") && has("python3")
    nnoremap <silent> <leader>F :call lazy#Defx_toggle()<CR>
endif
" Defx END }}}2

" Denite  {{{2
if has("nvim") && has("python3")
    packadd! denite.nvim
    packadd! denite-extra

    if has("nvim-0.4.0")
        call denite#custom#option('default', {'split': 'floating'})
    endif

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
    call denite#custom#map(
                \ 'insert',
                \ '<esc>',
                \ '<denite:quit>',
                \ 'noremap'
                \)

    " Change sorters.
    call denite#custom#source(
                \ '_', 'sorters', ['sorter_sublime'])

    " Change file_rec command.
    if executable('fd')
        call denite#custom#var('file/rec', 'command',
                    \ ['fd', '-t', 'f', '.'])
    elseif executable('rg')
        call denite#custom#var('file/rec', 'command',
                   \ ['rg', '--files', '--glob', '!.git'])
    elseif executable('ag')
        call denite#custom#var('file/rec', 'command',
                    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    endif

    " Change grep source
    if executable('rg')
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts',
                    \ ['--smart-case', '--vimgrep', '--no-heading', '-U'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    elseif executable('ag')
        call denite#custom#var('grep', 'command', ['ag'])
        call denite#custom#var('grep', 'default_opts',
                    \ ['-i', '--vimgrep'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', [])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif

    " history
    call denite#custom#var('command_history', 'ignore_command_regexp', ['^[A-Za-z]+$'])

    " Change default prompt
    call denite#custom#option('_', {
                \ 'prompt': '▸',
                \ 'winheight': 16,
                \ 'vertical_preview': 1,
                \ 'statusline': v:false,
                \ })

    nnoremap <silent> <Leader><space>  :<C-u>Denite -resume<CR>
    nnoremap <silent> <Leader>j :call execute('Denite -resume -cursor-pos=+1 -immediately')<CR>
    nnoremap <silent> <Leader>k :call execute('Denite -resume -cursor-pos=-1 -immediately')<CR>
    nnoremap <silent> <Leader>df :call execute("Denite file/rec:" . proj#root())<CR>
    nnoremap <silent> <Leader>dj :<C-u>Denite jump<CR>
    nnoremap <silent> <Leader>dt :<C-u>Denite tag<CR>
    nnoremap <silent> <Leader>dg :<C-u>Denite grep<CR>
    nnoremap <silent> <Leader>* :call execute("Denite grep:::" . shellescape(expand("<cword>")))<CR>
    nnoremap <silent> <Leader>dd :<C-u>Denite line<CR>
    nnoremap <silent> <Leader>db :<C-u>Denite buffer<CR>
    nnoremap <silent> <Leader>dc :<C-u>Denite command<CR>
    nnoremap <silent> <Leader>dH :<C-u>Denite command_history<CR>
    nnoremap <silent> <Leader>dh :<C-u>Denite help<CR>
    nnoremap <silent> <Leader>do :<C-u>Denite outline<CR>
    nnoremap <silent> <Leader>dO :<C-u>Denite file/old<CR>
    nnoremap <silent> <Leader>dr :<C-u>Denite register<CR>
    nnoremap <silent> <Leader>dl :<C-u>Denite location_list<CR>
    nnoremap <silent> <Leader>dq :<C-u>Denite quickfix<CR>
    nnoremap <silent> <Leader>dm :<C-u>Denite mark<CR>
endif
" Denite END }}}2

" operator-replace {{{2
map _ <Plug>(operator-replace)
" operator-replace END }}}2

" operator-end {{{2
map <silent> ; <Plug>(operator-end-toggle-semicolon)
map <silent> , <Plug>(operator-end-toggle-comma)
" operator-end }}}2

" textobj-comment {{{2
let g:textobj_comment_no_default_key_mappings = 1

xmap a? <Plug>(textobj-comment-a)
omap a? <Plug>(textobj-comment-a)
xmap a/ <Plug>(textobj-comment-big-a)
omap a/ <Plug>(textobj-comment-big-a)
xmap i/ <Plug>(textobj-comment-i)
omap i/ <Plug>(textobj-comment-i)
" textobj-comment END }}}2

" textobj-entire {{{2
let g:textobj_entire_no_default_key_mappings = 1

xmap aP <Plug>(textobj-entire-a)
omap aP <Plug>(textobj-entire-a)
xmap iP <Plug>(textobj-entire-i)
omap iP <Plug>(textobj-entire-i)
" textobj-entire END }}}2

" caw {{{2
let g:caw_operator_keymappings = 1
nmap <Leader>c <Plug>(caw:prefix)
xmap <Leader>c <Plug>(caw:prefix)
" caw END }}}2

" surround {{{2
nmap <Leader>sa <Plug>(operator-surround-append)
xmap <Leader>sa <Plug>(operator-surround-append)
nmap <Leader>sd <Plug>(operator-surround-delete)
xmap <Leader>sd <Plug>(operator-surround-delete)
nmap <Leader>sr <Plug>(operator-surround-replace)
xmap <Leader>sr <Plug>(operator-surround-replace)
" surround END }}}2

" clever-f {{{2
let g:clever_f_across_no_line=1 " only match the current line
let g:clever_f_fix_key_direction=1 " fix f to forward and F backword, tT etc.
let g:clever_f_chars_match_any_signs="^" " use ^ to match all signs
let g:clever_f_use_migemo=1 " enable migemo support
" clever-f }}}2

" sneak {{{2
let g:sneak#s_next = 1 " clever-f-like s/S support
let g:sneak#label = 1 " eazymotion-like s/S enhance
let g:sneak#f_reset = 0 " continue to use ;, for sneak
let g:sneak#t_reset = 0 " ^
let g:sneak#absolute_dir = 1 " s; forwards only and S, backwards only

map s <Plug>Sneak_s
map S <Plug>Sneak_S

augroup Sneak_Color
    au!
    autocmd VimEnter,ColorScheme * :hi Sneak guifg=black ctermfg=black guibg=#FFE53D ctermbg=003
augroup END
" sneak END }}}2

" vim-slash {{{2
noremap <plug>(slash-after) zz
" vim-slash END }}}2

" deoplete {{{2
if has("nvim") && has('python3')
    packadd! deoplete.nvim
    " even show completions when there is only one result
    set completeopt=longest,menuone
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
    " inoremap <silent><expr><CR>
    "            \ pumvisible() ? deoplete#close_popup() :
    "            \ "\<CR>"
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources._ = ['buffer', 'javacomplete2']
    let g:deoplete#omni#functions = {}

    " do not truncate the type of the completed item
    call deoplete#custom#source('_', 'max_abbr_width', 0)
    call deoplete#custom#source('_', 'max_kind_width', 0)
    call deoplete#custom#source('_', 'max_menu_width', 0)
    " enable deoplete
    call deoplete#enable()
endif

if has("patch-7.4.314")
    set shortmess+=c
endif

if has ("nvim-0.4.0") || has("patch-8.1.1270")
    set shortmess-=S
endif

let g:echodoc_enable_at_startup=1
if has("nvim-0.4.0")
    let g:echodoc#type="floating"
else
    let g:echodoc#type="echo"
endif
" deoplete END }}}2

" LSP {{{2
augroup Lazy_Loaded_LSP
    au!
    autocmd FileType rust,java,python,c,cpp,cuda,objc
                    \ call lazy#LC_starts()
augroup END

let g:LanguageClient_settingsPath = $HOME . '/.config/nvim/settings.json'
let g:LanguageClient_autoStart=0
let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_selectionUI = "location-list"
let g:LanguageClient_loggingFile = "/tmp/LSPClient.log"
let g:LanguageClient_serverStderr = "/tmp/LSPServer.log"
let g:LanguageClient_fzfContextMenu = 0
if has("nvim-0.4.0")
    let g:LanguageClient_hoverPreview = "Always"
endif

let g:LanguageClient_diagnosticsDisplay = {
    \   1: {
    \       "name": "Error",
    \       "texthl": "ALEError",
    \       "signText": "▐▌",
    \       "signTexthl": "ALEErrorSign",
    \       "virtualTexthl": "Error",
    \   },
    \   2: {
    \       "name": "Warning",
    \       "texthl": "ALEWarning",
    \       "signText": "▐▌",
    \       "signTexthl": "ALEWarningSign",
    \       "virtualTexthl": "Todo",
    \   },
    \   3: {
    \       "name": "Information",
    \       "texthl": "ALEInfo",
    \       "signText": "▐▌",
    \       "signTexthl": "ALEInfoSign",
    \       "virtualTexthl": "Todo",
    \   },
    \   4: {
    \       "name": "Hint",
    \       "texthl": "ALEInfo",
    \       "signText": "▐▌",
    \       "signTexthl": "ALEInfoSign",
    \       "virtualTexthl": "Todo",
    \   },
    \ }

let g:LanguageClient_serverCommands = {
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'kotlin': ['~/Workspace/kotlin/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'java': ['jdtls'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['package.json'],
    \ 'typescript': ['package.json'],
    \ 'rust': ['Cargo.toml'],
    \ 'kotlin': ['build.gradle'],
    \ 'java': ['build.gradle', 'build.xml'],
    \ }
" LSP END }}}2

" Rainbow Parentheses {{{2
let g:rainbow_active = 1

let g:rainbow_conf = {
            \	'guifgs': ['#d65d0e', '#cc241d', '#b16286', '#458588'],
            \	'ctermfgs': ['166', 'red', 'magenta', 'blue'],
            \	'operators': '',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold'],
            \	'separately': {
            \		'*': 0,
            \		'racket': {},
            \       'lisp': {},
            \       'json' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']},
            \       'jsonnet' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']},
            \       'hocon' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']},
            \       'rust' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/(/ end=/)/ fold']},
            \	}
            \}
" Rainbow Parentheses END }}}2

" tmux {{{2
if executable('tmux')
    packadd! vim-tmux-navigator
else
  nnoremap <silent> <c-h> <c-w><c-h>
  nnoremap <silent> <c-j> <c-w><c-j>
  nnoremap <silent> <c-k> <c-w><c-k>
  nnoremap <silent> <c-l> <c-w><c-l>
endif
" tmux END }}}2

" gutentags {{{2
let g:gutentags_exclude_project_root = ['/usr/local', $HOME . '/.password-store']
let g:gutentags_exclude_filetypes = ["gitcommit"]
if executable('ctags')
    packadd! vim-gutentags
endif
" gutentags END }}}2

" editorconfig {{{2
if (has('python3') || has('python')) && executable('editorconfig')
    let g:EditorConfig_max_line_indicator = "exceeding"
    packadd! editorconfig-vim
endif
" editorconfig END }}}2

" fcitx {{{2
if (has('python3') || has('python')) && executable('fcitx')
    packadd! fcitx.vim
endif
" fcitx END }}}2

" mundo {{{2
nnoremap <silent> <leader>u :MundoToggle<CR>
let g:mundo_prefer_python3=1
" mundo END }}}2

" PLUGINS SETTINGS END }}}1

" LANGUAGE SPECIFIC {{{1

"""""""""""""""""""""""""""
"  Tridactyl temporaries  "
"""""""""""""""""""""""""""

let g:markdown_fenced_languages = ['rust', 'c', 'javascript', 'html', 'python']

if has("autocmd")
    augroup Tridactyl_Temp
        au!
        autocmd BufRead /tmp/tmp_*.{com,cn,net,org}_*.txt
                    \ set ft=markdown
    augroup END
endif " has("autocmd")

" LANGUAGE SPECIFIC END }}}1

" SPELLINGS {{{1
ia defien define
ia dfine define
ia dfeien define
ia dfeine define
ia improt import
ia whiel while
ia reutrn return
ia reutnr return
ia breka break
ia contineu continue
" SPELLINGS END }}}1

" vim: foldenable:foldmethod=marker
