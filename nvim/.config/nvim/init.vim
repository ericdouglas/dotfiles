call plug#begin('~/.config/nvim/plugged')

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'

" several themes
Plug 'flazz/vim-colorschemes'

" execute code checks, find mistakes, in the background
Plug 'neomake/neomake'
  " Run Neomake when save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END

  let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" jump between files
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features

" elixir documentation lookup, jump to definition, mix, iex, completion
Plug 'slashmili/alchemist.vim'
" for documentation
Plug 'powerman/vim-plugin-AnsiEsc'

" CtrlP: Full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  map <C-t> :NERDTreeToggle<CR>

" Git marker for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
let g:NERDTreeShowIgnoredStatus=0

" Better statusbar
Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  set laststatus=2

Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='jellybeans'

" vue files need special handling because of their
" mix of different languages in one big file
autocmd FileType vue syntax sync fromstart

" Git Gutter: shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
" without any weird color
highlight clear SignColumn

" Toggle comment blocks
Plug 'tpope/vim-commentary'

" resize windows easily
Plug 'jimsei/winresizer'

Plug 'mattn/emmet-vim'
  let user_emmet_expandabbr_key = 'tg'

Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

Plug 'terryma/vim-multiple-cursors'

Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plug 'Raimondi/delimitMate'

Plug 'ap/vim-css-color'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
retab
set relativenumber
set autoindent
set smartindent
set cursorline
set cursorcolumn
set autoread
set encoding=utf-8
" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" ignore case when searching
set ignorecase
" ignore case when searching lowercase
set smartcase
" set the tile of the tab
set title
" enable true colors
set termguicolors
set t_Co=256
" show the linebreak if wrapping is enabled
set showbreak=↪
" hide -- INSERT -- in the status bar
set noshowmode
" show white space
set listchars=eol:¬,space:·
set list

" theme
set background=dark
syntax enable
colorscheme flatcolor
"colorscheme jellybeans
"colorscheme molokai
"colorscheme onedark

let g:mapleader=','
" highlight colums 80 and 120
let &colorcolumn="81,".join(range(121,121),",")
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" stop highlighting on Enter
map <CR> :noh<CR>
" open new files in the same folder of the current opened file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" paste something using the paste mode
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
" press i to enter insert mode, and kj to exit
:imap kj <Esc>

" go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" navigate through tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Move selected block up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Enable spell as default only for certain files
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
