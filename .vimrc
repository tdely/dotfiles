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

" Mark with column at 80 line width
set colorcolumn=80

" Highlight line and column (toggle with '\c')
hi CursorLine   cterm=NONE ctermbg=DarkGray
hi CursorColumn cterm=NONE ctermbg=DarkGray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Toggle line length column marker
function! ColorColumnToggle()
    if !&colorcolumn
        setlocal colorcolumn=80
    elseif &colorcolumn == 80
        setlocal colorcolumn=120
    else
        setlocal colorcolumn=0
    endif
endfunction
nnoremap <Leader>l :call ColorColumnToggle()<CR>

" Toggle paste mode
nnoremap <Leader>p :set paste!<CR>

" Allow modified buffers to be hidden
set hidden

" Open new buffer
nnoremap <C-t> :enew<CR>

" Move between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close buffer and move to previous buffer
nnoremap <C-w> :bp <BAR> bd #<CR>

" List status of open buffers
nnoremap <Leader>bl :ls<CR>

" Show trailing whitespace as error
match ErrorMsg '\s\+$'

" Keyboard shortcut to remove trailing whitespace
nnoremap <Leader>w :%s/\s\+$//e<CR>
