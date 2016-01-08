" Enable syntax highlighting
syntax on
set encoding=utf8
set fenc=utf-8

try
    colorscheme desert
catch
endtry
set background=dark

let mapleader=","

" Allow intelligent auto-indenting for each filetype
filetype indent plugin on

set nostartofline
set backspace=indent,eol,start

" Raise dialogue on unsaved changes
set confirm

" Neither flash nor beep on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set statusline=%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set display=lastline
set cmdheight=2 " Set the command window height to 2 lines
set showmode
set showcmd
set number
set hidden

set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Move cursor to matched string while typing the search pattern
set incsearch

set ignorecase " Use case insensitive search
set smartcase  " ..except when using capital letters

" Highlight line and column (toggle with '\c')
hi CursorLine   cterm=NONE ctermbg=DarkGray
hi CursorColumn cterm=NONE ctermbg=DarkGray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Toggle line length column marker
set colorcolumn=80
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

" Open new buffer
nnoremap <C-t> :enew<CR>

" Move between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close buffer and move to previous buffer
nnoremap <Leader>bc :bp <BAR> bd #<CR>

" List status of open buffers
nnoremap <Leader>bl :ls<CR>

" sudo write to file
command W w !sudo tee %

" Show trailing whitespace as error
match ErrorMsg '\s\+$'

" Keyboard shortcut to remove trailing whitespace
nnoremap <Leader>w :%s/\s\+$//e<CR>
