call plug#begin("~/AppData/Local/nvim/plugged")
  " Themes
  Plug 'overcache/NeoSolarized'
  " Programming
  Plug 'alaviss/nim.nvim'
  Plug 'dense-analysis/ale'
  " General
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons' " always after nerdtree
call plug#end()

" Theme
if (has("termguicolors"))
 set termguicolors
endif
set guifont=Hack\ NF:h12
set background=light
colorscheme NeoSolarized
language en_US

"
syntax on
set encoding=utf8
set fenc=utf-8

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

" Show trailing whitespace as error
match ErrorMsg '\s\+$'

" Toggleable highlight of line and column
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

imap <S-Insert> <C-R>*  " Paste on Shift-Insert

nmap <C-w> <C-S-w>  " Use CTRL-SHIFT for window control
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <Leader>p :set paste!<CR>   " Toggle paste mode
nnoremap <C-t> :tabnew<CR>           " Open new tab
nnoremap <Tab> :tabnext<CR>          " Next tab
nnoremap <S-Tab> :tabprevious<CR>    " Prev tab
nnoremap <C-w> :tabclose<CR>         " Close tab
nnoremap <C-Tab> :bnext<CR>          " Next buffer
nnoremap <C-S-Tab> :bprevious<CR>    " Prev buffer
nnoremap <C-A-w> :bp <BAR> bd #<CR>  " Close buffer and move to previous
nnoremap <Leader>w :%s/\s\+$//e<CR>  " Remove trailing whitespace

command W w !sudo tee %    " sudo write to file
command Strip %s/\s\+$//e  " Command to remove trailing whitespace

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\~$']
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 30<CR>

" NERDTree Syntax Highlight
let g:NERDTreeHighlightFolders = 1          " Folder highlight
let g:NERDTreeHighlightFoldersFullName = 1  " .. highlight name
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {}  " Avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue

let g:NERDTreeExactMatchHighlightColor = {}  " Avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange

let g:NERDTreePatternMatchHighlightColor = {}  " Avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red

let g:WebDevIconsDefaultFolderSymbolColor = s:beige
let g:WebDevIconsDefaultFileSymbolColor = s:blue

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
\   "Modified"  : "✹",
\   "Staged"    : "✚",
\   "Untracked" : "✭",
\   "Renamed"   : "➜",
\   "Unmerged"  : "═",
\   "Deleted"   : "✖",
\   "Dirty"     : "✗",
\   "Clean"     : "✔︎",
\   'Ignored'   : '☒',
\   "Unknown"   : "?"
\ }

" Asynchronous Lint Engine (ALE)
let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\}
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Orange
