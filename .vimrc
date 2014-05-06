" Remap escape
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <esc>

" Allow scrolling with - and =
nnoremap = M2kzz
nnoremap - M2jzz

" Enable scrolling with mouse
set mouse=a

" Move by display lines with word wrap
nnoremap j gj
nnoremap k gk

" Semicolon is easier to type than colon
nnoremap ; :

" Enter paste mode from insert mode
set pastetoggle=qp

" Change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers instead of closing them
set hidden

" map <C-t><right> :tabl<cr>
" map <C-t><left> :tabr<cr>
" map <C-t><down> :tabp<cr>
" map <C-t><up> :tabn<cr>

syntax on         " syntax highlighting
" set nowrap        " don't wrap lines

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab     " use spaces instead of tabs
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" set out tab characters, trailing whitespace
" and invisible spaces visually, and
" additionally use the # sign at the end of lines
" to mark lines that extend off-screen
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" plugins
execute pathogen#infect()

map <silent> <leader>t :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" let g:kolor_italic=1                    " Enable italic. Default: 1
" let g:kolor_bold=1                      " Enable bold. Default: 1
" let g:kolor_underlined=0                " Enable underline. Default: 0
" let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
" colorscheme kolor
