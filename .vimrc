set shell=/bin/bash
set nocompatible
filetype on
syntax on
syntax sync fromstart

"-----General Settings-----
set backspace=indent,eol,start
set relativenumber
set number
set showcmd
set incsearch
set hidden
set hlsearch
set gdefault
set autoread

"set termguicolors

" Make .vue files have .html rules applied to them
let html_no_rendering=1
"autocmd BufRead,BufNewFile *.vue setfiletype html
"au BufNewFile,BufRead *.vue setf vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" Enable mouse support
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" When scrolling with cursor, keeps cursor 5lines from top or bottom
set scrolloff=10

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----------------------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai' "Molokai Theme for Gui (MacVim)
Plug 'phanviet/vim-monokai-pro'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'scrooloose/nerdtree' "Filetree Browser
Plug 'dense-analysis/ale' "Asynchronous Linting Engine

Plug 'vim-airline/vim-airline' "Statusbar 
"Plug 'itchyny/lightline.vim' " Statusbar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround' "Plugin for surrounding characters like ( { [ ' 
Plug 'Raimondi/delimitMate' "Automatically closes quotes parenthesis etc
Plug 'alvan/vim-closetag' "Automatically close html/XML tags
"Plug 'scrooloose/syntastic' "Syntax checker/linter
Plug 'yggdroot/indentline' " Show indent level lines
Plug 'scrooloose/nerdcommenter' " Comment code in multiple languages
"Plug 'jiangmiao/auto-pairs' " Automatically close tags

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sheerun/vim-polyglot' "Collection of language packs for Vim
"Plug 'isRuslan/vim-es6' "ES6 Syntax highlighting
"Plug 'dag/vim-fish' "Support for fish shell script syntax highlighting
"Plug 'posva/vim-vue' "Syntax support for VueJS
"Plug 'leafgarland/typescript-vim' 
"Plug 'mustache/vim-mustache-handlebars'

Plug 'christoomey/vim-tmux-navigator'


call plug#end()
" ----------------------------------------------------------------------------------------------------------------

function CloseBuffer() 
  execute ':bp|bd #'
endfunction



" ALE Settings
"let g:ale_completion_enabled = 1
nnoremap <silent> <leader>ag :ALEGoToDefinition<CR>

" Color Schemes
colorscheme monokai_pro
colorscheme dracula
"colorscheme molokai
"if has ('gui_running')
"  colorscheme monokai_pro
"  let g:molokai_original = 0
"else 
"  "colorscheme lanox
"endif

" Temporary YouCompleteMe/DelimitMate backspace issue workaround
" ----------------------------------------------------------------
imap <silent> <BS> <C-R>=YcmOnDeleteChar()<CR><Plug>delimitMateBS
function! YcmOnDeleteChar()
  if pumvisible()
    return "\<C-y>"
  endif
  return "" 
endfunction
" ----------------------------------------------------------------

" CloseTag settings
" Fix conflict between delimitmate and closetag
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"


" Set directory so swp files are stored there
silent !mkdir ~/.vim/swp/ > /dev/null 2>&1
set directory=~/.vim/swp/

" Airlines plugins display buffer lab list at top
let g:airline#extensions#tabline#enabled = 1
" Status bar always on
set laststatus=2

" Tab inserts spaces instead of hard tab
filetype plugin indent on
au Filetype python setl et ts=4 sw=4
set autoindent
" Change number of characters that tab uses
set tabstop=2
set softtabstop=2
" Change number of characters that '>' uses
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab


au Filetype python setl et ts=2 sw=2 sts=2

" Change the wrap settings so lines autowraps to the next one
set wrap
" When line wraps, begin wrapping portion at the same indent level as previous line
set breakindent

" Allows vim to jump to last cursor postion when returning to file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ------Persistent Undo History------
silent !mkdir ~/.vim/undo/ > /dev/null 2>&1
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

"-----Key Bindings-----
" Remap remap jj to ESC
inoremap jj <ESC>

" Leader + \ or - to split
nnoremap <silent> <leader>w <c-w>

" Map Ctrl j and k to scroll up and down 1 line at a time
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" Map shift-u to redo
nnoremap <c-r> <NOP>
nnoremap <s-u> :redo <CR>

" Map tab and shift-tab to scroll through the next and previous buffers respectively
nnoremap <silent> gl :bnext<CR>
nnoremap <silent> gh :bprevious<CR>
nnoremap <silent> <c-w> :call CloseBuffer()<CR>
nnoremap <silent> <D-0>  :set guifont=Terminus\ (TTF):h14<CR>

" Keys to navigate between splits
" Characters are generated with option+<key> on macOS keyboard
nnoremap <silent> ˙ :wincmd h<CR>
nnoremap <silent> ∆ :wincmd j<CR>
nnoremap <silent> ˚ :wincmd k<CR>
nnoremap <silent> ¬ :wincmd l<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>

nnoremap <silent> ˙ :TmuxNavigateLeft<cr>
nnoremap <silent> ∆ :TmuxNavigateDown<cr>
nnoremap <silent> ˚ :TmuxNavigateUp<cr>
nnoremap <silent> ¬ :TmuxNavigateRight<cr>

" NERD Tree File manager toggle on ctrl-b
nnoremap <silent> <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Map Ctrl-p to fuzzy find files in current directory
map <silent> <C-p> :Files<CR>
map <silent> <C-p><C-p> :Buffers<cr>

so ~/.vim/coc.vim
