" ### VUNDLE SETTINGS ###
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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
" productivity
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'quinoa42/vim-snippets'
" syntax
Plugin 'vimperator/vimperator.vim'
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

" ####################################################
" ### VIM SETINGS ###
" encodings setting
set enc=utf-8
set fileencodings=utf-8,gbk,big5
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

" enable 256 colors
set t_Co=256
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

" #####################################################
" ### PLUGINS SETTING ###
" Airline
" use Powerline symbols(special fonts requried)
let g:airline_powerline_fonts = 1
" theme
let g:airline_theme='solarized'
" hide empty sections
let g:airline_skip_empty_sections = 1

" Indent Guides
" start with vim
let g:indent_guides_enable_on_vim_startup=1
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

" NerdTree
" auto close NERDTree after open something
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
augroup NERD_TREE_SETTING
    au!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" NERD_Comment
let NERDCommentEmptyLines=1 " also comment empty line
let NERDDefaultAlign='both' " align on left&right
let NERDCommentWholeLinesInVMode=1 "comment whole line in V-mode
let NERDSpaceDelims=1 " add extra space
let NERDCreateDefaultMappings=0 " disable default mapping

" YAML
augroup YAML_INITIAL
    au!
    autocmd FileType yaml :setlocal tabstop=2
    autocmd FileType yaml :setlocal shiftwidth=2
    autocmd FileType yaml :setlocal softtabstop=2
augroup END

" set markdown for *.tmp called by vimperator
augroup Markdown_Initial
    au!
    autocmd VimEnter *.tmp :set ft=markdown
    autocmd FileType markdown :setlocal wrap
    autocmd FileType markdown :setlocal linebreak
    autocmd FileType markdown :setlocal nonumber
    autocmd FileType markdown :SoftPencil
augroup END

" vim-markdown & pencil
let g:vim_markdown_frontmatter = 1 " YAML frontmatter for Jekyl
"let g:vim_markdown_conceal = 0 " disable the conceal since it's tooooo ugly
let g:airline_section_x = '%{PencilMode()}'

" Goyo setting
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

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" UlitSnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-a><c-a>"
let g:UltiSnipsListSnippets="<c-a>l"
let g:UltiSnipsJumpForwardTrigger="<c-a><c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>k"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" #####################################################
" ### KEYMAP ###
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
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" Goyo
nmap <Leader>G :Goyo<CR>
" NERD_TREE
nmap <Leader>N :NERDTreeToggle<CR>
" NERD_Comment
" ;cb --> comment toggle
map <Leader>cb <plug>NERDCommenterToggle
" ;cc --> comment at the end of this line
map <Leader>cc <plug>NERDCommenterAppend
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
