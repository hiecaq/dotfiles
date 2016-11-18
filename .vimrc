""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              VUNDLE SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " ### plugin list begins here
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" User Interface
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
" other functions
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'rhysd/clever-f.vim'
Plugin 'justinmk/vim-sneak'
" productivity
Plugin 'jez/vim-superman'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'quinoa42/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
" syntax
Plugin 'vimperator/vimperator.vim'
Bundle 'dogrover/vim-pentadactyl'
Plugin 'plasticboy/vim-markdown'
" All of your Plugins must be added before the following line
call vundle#end()   " ### plugin list ends here
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM SETTINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encodings setting
set enc=utf-8
set fileencodings=utf-8,gbk,big5
" search while typing patterns
set incsearch
" ignore cases in search
set ignorecase
" vim's default wild completion for commands
set wildmenu

" enable 256 colors
set t_Co=256
set termguicolors
" color theme
colorscheme solarized
" set background type
set background=dark

" always show status line
set laststatus=2
" disable default mode indicator(have airline already)
set noshowmode
" show position of cursor
set ruler
" show line numbers
set number
" highlight the current line/column
"set cursorline
"set cursorcolumn
" highlight search results
set hlsearch
" no line wrap
set nowrap

" enable syntax highlights
syntax enable
" allow to replace default syntax highlights with intended ones
syntax on
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                KEY MAPPINGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <Leader>
let mapleader=";"
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

"""""""""""""""""""
"  Indent Guides  "
"""""""""""""""""""

" start with vim
let g:indent_guides_enable_on_vim_startup=1
" exclude filetypes
let g:indent_guides_exclude_filetypes = ['help', 'man']
" show indent starts from 2 level
let g:indent_guides_start_level=2
" size
let g:indent_guides_guide_size=1
" manually set colors
let g:indent_guides_auto_colors = 0
augroup Indent_Guides_Initial
    au!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=011
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=000
augroup END

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
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

""""""""""""
"  Pencil  "
""""""""""""

let g:airline_section_x = '%{PencilMode()}'

"""""""""""
"  sneak  "
"""""""""""

let g:sneak#s_next=1 " clever-f-like s/S support
let g:sneak#streak=1 " eazymotion-like s/S enhance
let g:sneak#f_reset=0 " continue to use ;, for sneak
let g:sneak#t_reset=0 " ^
let g:sneak#absolute_dir=1 " s; forwards only and S, backwards only
" explicit repeat (as opposed to implicit 'clever-s' repeat)
map ' <Plug>SneakNext
map , <Plug>SneakPrevious

""""""""""""""
"  clever-f  "
""""""""""""""
let g:clever_f_across_no_line=1 " only match the current line
let g:clever_f_fix_key_direction=1 " fix f to forward and F backword, tT etc.
let g:clever_f_chars_match_any_signs=";" " use ; to match all signs
let g:clever_f_use_migemo=1 " enable migemo support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              SYNTAX SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""
"  Markdown  "
""""""""""""""

let g:vim_markdown_frontmatter = 1 " YAML frontmatter for Jekyl
let g:vim_markdown_conceal = 0 " disable the conceal since it's tooooo ugly
augroup Markdown_Initial
    au!
    autocmd VimEnter *.tmp :set ft=markdown " set markdown for *.tmp called by vimperator
    autocmd FileType markdown :setlocal wrap
    autocmd FileType markdown :setlocal linebreak
    autocmd FileType markdown :setlocal nonumber
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

