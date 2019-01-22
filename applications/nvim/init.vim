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
" disable default mode indicator(have airline already)
set noshowmode
" show position of cursor
set ruler
" show relative line numbers
set norelativenumber
" show line numbers
set number
" no line wrap
set nowrap
" auto load plugin files for specific file types
filetype plugin on
" auto indent of file
filetype indent on
" enable syntax highlights
syntax on
" allow to replace default syntax highlights with intended ones
syntax enable
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
"                                KEY MAPPINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <Leader>
nnoremap <space> <Nop>
vnoremap <space> <Nop>
let mapleader="\<space>"
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
" close preview window
nmap Q <c-w><c-z>
" spell-check toggle
nmap <Leader>SL :setlocal invspell spelllang=en_us<CR>
nmap <Leader>SA :spellr<CR>
" quick add empty lines
nnoremap <silent> <Leader>O  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <silent> <Leader>o  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Provider                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim") && has("mac")
    let g:python_host_prog = $HOME . "/.pyenv/versions/neovim2/bin/python"
    let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim3/bin/python"
endif

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
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
" extension for ale
" let g:airline#extensions#ale#enabled = 1
" let airline#extensions#ale#error_symbol = 'E:'
" let airline#extensions#ale#warning_symbol = 'W:'
" extension for tagbar
let g:airline#extensions#tagbar#enabled = 0
let g:airline_focuslost_inactive=1
let g:airline_detect_modified=1

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
if !has("nvim") && has("autocmd")
    let g:indent_guides_auto_colors = 0
    augroup Indent_Guides_Initial
        au!
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=011
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=000
    augroup END
endif

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsListSnippets="<c-a>l"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-a><c-a>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/pack/environment/start/vim-snippets/UltiSnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" python
let g:ultisnips_python_style="sphinx"

""""""""""""
"  Denite  "
""""""""""""
packadd denite

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
            \ ['rg', '--files', '--glob', '!.git'])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['rg'])
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

""""""""""""""""""""
"  textobj-entire  "
""""""""""""""""""""
let g:textobj_entire_no_default_key_mappings = 1

xmap aP <Plug>(textobj-entire-a)
omap aP <Plug>(textobj-entire-a)
xmap iP <Plug>(textobj-entire-i)
omap iP <Plug>(textobj-entire-i)

augroup Lazy_Loaded_Text_Obj_And_Operators
    au!
    autocmd FileType python :packadd vim-textobj-python
                \ | runtime! OPT after/ftplugin/python/textobj-python.vim
    autocmd FileType java,c,vim :packadd vim-textobj-function
                \ | runtime! OPT after/ftplugin/*/textobj-function.vim
augroup END

"""""""""
"  caw  "
"""""""""
let g:caw_operator_keymappings = 1
nmap <Leader>c <Plug>(caw:prefix)
xmap <Leader>c <Plug>(caw:prefix)

""""""""""""""
"  surround  "
""""""""""""""
nmap <Leader>sa <Plug>(operator-surround-append)
xmap <Leader>sa <Plug>(operator-surround-append)
nmap <Leader>sd <Plug>(operator-surround-delete)
xmap <Leader>sd <Plug>(operator-surround-delete)
nmap <Leader>sr <Plug>(operator-surround-replace)
xmap <Leader>sr <Plug>(operator-surround-replace)


""""""""""""""
"  clever-f  "
""""""""""""""
let g:clever_f_across_no_line=1 " only match the current line
let g:clever_f_fix_key_direction=1 " fix f to forward and F backword, tT etc.
let g:clever_f_chars_match_any_signs=";" " use ; to match all signs
let g:clever_f_use_migemo=1 " enable migemo support


"""""""""""
"  sneak  "
"""""""""""
let g:sneak#s_next = 1 " clever-f-like s/S support
let g:sneak#label = 1 " eazymotion-like s/S enhance
let g:sneak#f_reset = 0 " continue to use ;, for sneak
let g:sneak#t_reset = 0 " ^
let g:sneak#absolute_dir = 1 " s; forwards only and S, backwards only

augroup Sneak_Color
    au!
    autocmd VimEnter,ColorScheme * :hi Sneak guifg=black ctermfg=black guibg=#FFE53D ctermbg=003
augroup END

"""""""""""""""
"  vim-slash  "
"""""""""""""""
noremap <plug>(slash-after) zz

""""""""""""""
"  deoplete  "
""""""""""""""
if has("nvim")
    " enable deoplete
    let g:deoplete#enable_at_startup=1
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

endif

if has("patch-7.4.314")
    set shortmess+=c
endif

let g:echodoc_enable_at_startup=1
let g:echodoc#type="virtual"

augroup Lazy_Loaded_deoplete_completion_source
    au!
    autocmd FileType vim :packadd neco-vim
augroup END

"""""""""
"  LSP  "
"""""""""
function LC_starts()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        let g:quinoa42_loaded_lsp = 1
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <Leader>f :call LanguageClient_textDocument_codeAction()<CR>
        nnoremap <buffer> <silent> <Leader>ds :<C-u>Denite documentSymbol<CR>
        nnoremap <buffer> <silent> <Leader>dR :<C-u>Denite references<CR>
        nnoremap <buffer> <silent> <Leader>dS :<C-u>Denite workspaceSymbol<CR>
        nnoremap <buffer> <silent> <Leader>dF :<C-u>Denite contextMenu<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
        set hidden
        set signcolumn=yes
        packadd LanguageClient-neovim
        LanguageClientStart
    endif
endfunction

augroup Lazy_Loaded_LSP
    au!
    autocmd FileType rust,java,python
                    \ if !exists('g:quinoa42_loaded_lsp') |
                    \ call LC_starts() |
                    \ endif
augroup END

let g:LanguageClient_settingsPath = $HOME . '/.config/nvim/settings.json'
let g:LanguageClient_autoStart=0
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_selectionUI = "location-list"
let g:LanguageClient_loggingFile = "/tmp/LSPClient.log"
let g:LanguageClient_serverStderr = "/tmp/LSPServer.log"

let g:LanguageClient_serverCommands = {
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ 'cpp' : ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c' : ['cquery', '--log-file=/tmp/cq.log'],
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


"""""""""""""""""""""""""
"  Rainbow Parentheses  "
"""""""""""""""""""""""""
augroup Lazy_Loaded_Rainbow
    au!
    autocmd FileType json,racket,lisp,hocon :packadd rainbow
augroup END

let g:rainbow_active = 1

let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'seagreen4', 'firebrick3', 'darkorange3'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold'],
            \	'separately': {
            \		'*': 0,
            \		'racket': {},
            \       'lisp': {},
            \       'json' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']},
            \       'hocon' : {'parentheses': ['start=/{/ end=/}/ fold', 'start=/\[/ end=/\]/ fold']},
            \	}
            \}

""""""""""
"  tmux  "
""""""""""
if executable('tmux')
    packadd! vim-tmux-navigator
    packadd! tmux-complete
endif

"""""""""""""""
"  gutentags  "
"""""""""""""""

let g:gutentags_exclude_project_root = ['/usr/local', $HOME . '/.password-store']


""""""""""""""""""
"  editorconfig  "
""""""""""""""""""
if executable('editorconfig')
    packadd! editorconfig-vim
endif

"""""""""""
"  ctags  "
"""""""""""
if executable('ctags')
    packadd! vim-gutentags
endif

"""""""""""
"  fcitx  "
"""""""""""
if executable('fcitx')
    packadd! fcitx
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Language specific                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""
"  Tridactyl temporaries  "
"""""""""""""""""""""""""""

if has("autocmd")
    augroup Tridactyl_Temp
        au!
        autocmd BufRead /tmp/tmp_*.{com,cn,net,org}_*.txt
                    \ set ft=markdown
    augroup END
endif " has("autocmd")
