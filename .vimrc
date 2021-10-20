" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'romainl/vim-cool' "disables search highlights
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'romainl/vim-cool' "disables search highlighting
Plug 'tomasiser/vim-code-dark' "VS CODE THEME COLORS
Plug 'prettier/vim-prettier'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/open-pdf.vim' "Convert PDF to Text
Plug 'makerj/vim-pdf' "view PDF files
Plug 'ap/vim-css-color' "css colors for vim


call plug#end()
" ================================================================
" GENERAL SETUP
" ================================================================
set nocompatible " We're running Vim, not Vi!
set noshowmode "show which mode INSERT, VISUAL, NORMAL
set showcmd  "show pressed keys (must be after nocompatible)
set laststatus=2
set textwidth=100 " lines wrap (number of cols)
set number  " Show lines numbers
set tabstop=2 shiftwidth=2 expandtab "insert 2 spaces tabs
set autoread "Autoload file changes.
"Auto Intending
syntax on " Enable syntax highlighting
set autoindent " Auto-indent new lines
filetype plugin indent on
let g:jsx_ext_required = 1 "auto indent correction for jsx files
set splitbelow splitright
" Search
set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch " Searches for strings incrementally
let g:CoolTotalMatches = 1 "Show number of search matches in the command line
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir "Setting undo directory
set fillchars+=vert:\ 
"Removes | pipes

"Turn backup off
"set nobackup
"set nowb
set noswapfile
set hidden
set nowritebackup
set updatetime=300
set encoding=UTF-8

"ADVANCED SETUP
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start " Fixes common backspace problems
set wildchar=<Tab> wildmenu wildmode=full "wild menu settings
" ================================================================
" Colors ...
" ================================================================
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" "true colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme codedark

" ================================================================
" NERDTree
" ================================================================
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeQuitOnOpen = 0 "Close Nerd when open a file
map <C-f> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let g:nerdtree_sync_cursorline = 1
let NERDTreeAutoDeleteBuffer = 1

" ================================================================
" KEY MAPPINGS
" ================================================================
noremap <SPACE> <Nop>
let mapleader = " " "Leader key set to <SPACE>
nmap <silent><leader>w :wqa<cr>
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
noremap <silent> <leader><SPACE> :FZF<CR>

""EMMET SETTINGS""""""""""""""""""""""""""""
let g:user_emmet_leader_key=","
let g:user_emmet_settings = {
	\ 'javascript.jsx' : {
		\		'extends' : 'jsx',
  	\ },
	\}

" ================================================================
" FZF
" ================================================================
map <C-t> :FZF<CR> "FZF short cut set to space>space
map <silent><leader><SPACE> :FZF<CR>
let g:fzf_action = {
      \ 'ctrl-i': 'split',
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-s': 'vsplit',
      \ }
let g:fzf_layout = { 'down': '~40%' }
" ================================================================

"Persistent_undo feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

""PRETTIER Settings""""""""""""""""""""""""""""
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0

"""""""""""" SET MOUSE ISSUE""""""""""""""""""""
"SETTING MOUSE FUNCTIONALITY ON VIM
set mouse=nicr
set ttymouse=sgr

"Ignoring useless files for wildmenu
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""""""""""" COC CONFIGURATION""""""""""""""""""""
"COC Navigate with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
