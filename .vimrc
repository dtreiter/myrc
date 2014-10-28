" Remap escape so you just mash both 'j' and 'k'
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <esc>
inoremap jk <esc>
vnoremap jk <esc>
cnoremap jk <esc>

" Remap saving to mashing m,
nnoremap m, :w<CR>
nnoremap ,m :w<CR>

" Drag lines down
nnoremap K ddp

" Allow scrolling with - and =
nnoremap = M2kzz
nnoremap - M2jzz

" Quick buffer switching
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
" Tab switching
nnoremap ]t gt<CR>
nnoremap [t gT<CR>
" Scroll sideways
nnoremap ]z 15zl
nnoremap [z 15zh

" Make paste smart indent
nnoremap p ]p

" Remap Space to scroll down
nnoremap <Space> <C-d>
nnoremap <BS> <C-u>
nnoremap <Return> <C-u>

" Enable scrolling with mouse
set mouse=a
" Fix pane resizing inside tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

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

" git blame shortcut
nmap <silent> <leader>gl :Gblame<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gcm :Gcommit<CR>
nmap <silent> <leader>gd :Gdiff<CR>

" open NERDTree nav with <leader>t
map <silent> <leader>t :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" remap find to use easymotion
map f <Plug>(easymotion-s)

" autocomplete with tab
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
