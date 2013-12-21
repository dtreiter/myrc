" remap escape
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <esc>

nnoremap ; :

" Enter paste mode from insert mode
set pastetoggle=qp

" enable scrolling with mouse
set mouse=a

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers instead of closing them
set hidden

map <C-t><right> :tabl<cr>
map <C-t><left> :tabr<cr>
map <C-t><down> :tabp<cr>
map <C-t><up> :tabn<cr>

syntax on         " syntax highlighting
" set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
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
map <C-n> :NERDTreeToggle<CR>

