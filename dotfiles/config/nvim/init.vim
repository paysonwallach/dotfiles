set nocompatible

" --- Install Plugins ---

" vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'wincent/terminus'
Plug 'Yggdroot/indentLine'

" Color schemes
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()


" --- Vim Settings ---

syntax on
set hidden
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set mouse=a       " enable mouse support

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow    " open new buffers below the current

" Tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab            " insert tabs on the start of a line according to
                        "     shiftwidth, not tabstop

set nonumber
set whichwrap=<,>,[,]   " cursor wrap
set sidescroll=1        " scroll one character at a time to reveal more
                        "     text as needed

" Search
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        "     case-sensitive otherwise
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type


" --- Colors ----

set termguicolors       " enable 24-bit true colors
set background=dark

" Editor color scheme
colorscheme base16-onedark

" Airline theme
let g:airline_theme='base16'

" Remove background colors
hi VertSplit ctermbg=none guibg=none
hi SignColumn ctermbg=none guibg=none


" --- Invisibles ---

"set listchars=tab:»\ ,trail:·,eol:¬,extends:→,precedes:←
"set list
"highlight Specialkey ctermfg=239 guifg=#504945
"highlight NonText ctermfg=239 guifg=#504945

" indentLine
let g:indentLine_setColors = 1
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar=' '
let g:indentLine_leadingSpaceEnabled='1'

" Italicize comments
hi Comment cterm=italic gui=italic

autocmd InsertEnter,InsertLeave * set cul!


" --- Keyboard shortcuts ---

" remove need to hold down shift to enter a command
nnoremap ; :

cmap w!! w !sudo tee % >/dev/null

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>


" --- General Plugin Configurations ---

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0

" ale
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

hi ALEErrorSign ctermfg=167 guifg=#fb4934
hi ALEWarningSign ctermfg=214 guifg=#fabd2f
hi ALEInfoSign ctermfg=109 guifg=#83a598

hi ALEWarningLine ctermbg=none guibg=none
hi ALEWArningLine ctermbg=none guibg=none
hi ALEInfoLine ctermbg=none guibg=none

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources ={'_': 'ale'}

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '┃'
let g:gitgutter_sign_modified                  = '┃'
let g:gitgutter_sign_removed                   = '┃'
let g:gitgutter_sign_removed_first_line        = '┃'
let g:gitgutter_sign_modified_removed          = '┃'

hi GitGutterAdd ctermbg=none guibg=none ctermfg=245
hi GitGutterChange ctermbg=none guibg=none ctermfg=245
hi GitGutterDelete ctermbg=none guibg=none ctermfg=245
hi GitGutterChangeDelete ctermbg=none guibg=none ctermfg=245

" whitespace
let g:strip_whitespace_on_save = 1


" --- Syntax Highlighting ---

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

autocmd BufRead,BufNewFile *.py let python_highlight_all=1
