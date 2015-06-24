" Enable syntax highlighting
syntax on

try
    colorscheme desert
catch
endtry

set encoding=utf8

" Allow intelligent auto-indenting for each filetype
filetype indent plugin on

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in the
" status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Raise dialogue on unsaved changes
set confirm

" Neither flash nor beep on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set the command window height to 2 lines
set cmdheight=2

" Display line numbers
set number

" Enable mouse for all modes
"set mouse=a

" Spaces instead of tabs
set expandtab

set smarttab

" 1 tab is 4 spaces
set shiftwidth=4
set softtabstop=4

" Keep indentation on new line when no filetype-specific indenting is
" enabled
set autoindent

" Indent after if, else, etc.
set smartindent

" Theme for dark background
set background=dark

" Move cursor to matched string while typing the search pattern
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Highlight line and column (toggle with '\c')
hi CursorLine   cterm=NONE ctermbg=DarkGray
hi CursorColumn cterm=NONE ctermbg=DarkGray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Show trailing whitespace as error
match ErrorMsg '\s\+$'

" Keyboard shortcut to remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
