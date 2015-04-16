
" Settings {{{

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=500

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase


" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces, all file types
" set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers AND use relative number
set number
set relativenumber

" Highlight tailing whitespace
"set list listchars=tab:»·,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
"set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Don't show intro
"set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
" set splitright

" Highlight the current line and column
set cursorline
set cursorcolumn

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Display the mode you're in.
set showmode

" Complete files like a shell.
set wildmode=list:longest

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

set autoindent

set tags=./tags;

set t_Co=256

set fillchars+=vert:\ 

" Vertical line at 80 characters
set textwidth=80
set colorcolumn=+1

" Keep focus split large, others minimal
set winwidth=84
set winheight=7
set winminheight=7
set winheight=999

" Set built-in file system explorer to use layout similar to the NERDTree plugin
" let g:netrw_liststyle=3

" Enable built-in matchit plugin
runtime macros/matchit.vim

set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set list listchars=tab:»·,trail:·

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}


" Plugin {{{


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'             " https://github.com/scrooloose/syntastic
Plugin 'scrooloose/nerdtree'              " https://github.com/scrooloose/nerdtree
Plugin 'ctrlpvim/ctrlp.vim'               " https://github.com/ctrlpvim/ctrlp.vim
Plugin 'altercation/vim-colors-solarized' " https://github.com/altercation/vim-colors-solarized
Plugin 'bling/vim-airline'                " https://github.com/bling/vim-airline
Plugin 'tomtom/tcomment_vim'              " https://github.com/tomtom/tcomment_vim
Plugin 'benmills/vimux'                   " https://github.com/benmills/vimux
Plugin 'thoughtbot/vim-rspec'             " https://github.com/thoughtbot/vim-rspec
Plugin 'bronson/vim-trailing-whitespace'  " Remove trailing whitespace on save for ruby files.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
"
"
"General Mappings {{{

let mapleader =  " "

map <leader>\ :NERDTreeToggle<CR>
map <leader>ev :tabe ~/.vimrc<CR>
map <leader>q :source ~/.vimrc<CR>:AirlineRefresh<CR>
map <leader>s :w<CR>
map <leader>ra :%s/
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR> " Fix indentation on paste
map <C-t> <esc>:tabnew<CR> " Open a new tab with Ctrl+T

" vim-rspec
map <leader>f :call RunCurrentSpecFile()<CR>
map <leader>r :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>
let g:rspec_command = 'call VimuxRunCommand("clear; spring rspec {spec}")'
" let g:rspec_command = 'call VimuxRunCommand("clear; rspec {spec}")'

" Vimux
" Prompt for a command to run map
map <leader>vp :VimuxPromptCommand<CR>

" Inspect runner pane map
map <leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand. If a pane is closed manually,
" the vim-rspec commands will no longer cause a new pane to open. Calling
" :VimuxCloseRunner() will 'reset' Vimux, after which the vim-rspec commands
" will pop open a new pane as they did initially.
map <leader>vq :VimuxCloseRunner<CR>

" Zoom the tmux runner page
map <leader>vz :VimuxZoomRunner<CR>

" Set the size of the vimux window.
let g:VimuxHeight = "30"


" }}}



" Remove trailing whitespace on save for ruby files.
 au BufWritePre *.rb :%s/\s\+$//e



set background=dark
colorscheme solarized


if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
  endif

  let g:airline_symbols.linenr = 'Ln'
  let g:airline_powerline_fonts=1
  let g:airline_left_sep=''
  let g:airline_right_sep=''
