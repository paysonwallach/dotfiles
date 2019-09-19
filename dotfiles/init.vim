"--- Install Plugins ---

" vim-plug
" https://github.com/junegunn/vim-plug

" install if not already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" general plugins
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'

" syntax highlighters
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" color schemes
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline-themes'

" initialize plugin system
call plug#end()


" --- vim Settings ---

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

set showtabline=0

" cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


" --- colors ----

set background=dark

" editor color scheme
colorscheme dim

" airline theme
let g:airline_theme='deus'

" set background colors
highlight clear VertSplit
highlight clear SignColumn

let &colorcolumn=join(range(81,999),",")


" --- invisibles ---

set list
set listchars=tab:»\ ,trail:·,eol:¬,extends:→,precedes:←
highlight Specialkey ctermfg=239 guifg=#504945
highlight NonText ctermfg=239 guifg=#504945

" indentLine
let g:indentLine_setColors = 1
let g:indentLine_char = '•'
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'
let g:indentLine_bufNameExclude = ['_.*', '*minimap', '__Tagbar__.*']

" hide tildas
highlight EndOfBuffer ctermfg=235

" italicize comments
highlight Comment cterm=italic gui=italic


" --- keyboard shortcuts ---

" remove need to hold down shift to enter a command
nnoremap ; :

cmap w!! w !sudo tee % >/dev/null

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>


" --- general plugin configurations ---

" airline
let g:airline#extensions#ale#enabled = 1

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

" minimap
autocmd VimEnter * :Minimap

" tagbar
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']

autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd WinEnter __Tagbar__.* setlocal t_vi=
autocmd WinLeave __Tagbar__.* setlocal t_ve=

" whitespace
let g:strip_whitespace_on_save = 1
