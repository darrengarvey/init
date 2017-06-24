
call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'bling/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dkprice/vim-easygrep'
    " Disabled, needs compiling
    "Plug 'jeaye/color_coded'
    Plug 'jistr/vim-nerdtree-tabs'
    " Not sure I like this one. Worse than bash's Ctrl-R.
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'kopischke/vim-fetch'
    Plug 'mattn/emmet-vim'
    Plug 'majutsushi/tagbar'
    Plug 'mcandre/Conque-Shell'
    Plug 'nvie/vim-flake8'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'scrooloose/nerdtree'
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'terryma/vim-expand-region'
    Plug 'tmhedberg/SimpylFold'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'Valloric/ListToggle'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'vim-scripts/indentpython.vim'
    Plug 'vim-scripts/ZoomWin'
    Plug 'vim-syntastic/syntastic'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
    Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let mapleader = "\<Space>"

nnoremap <leader>h :nohlsearch<CR>

" Shortcuts for quick navigating
nnoremap <silent> <leader>k :BufExplorer<CR>
nnoremap <silent> <leader>o :CtrlP<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <leader>b :buffers<CR>:buffer<SPACE>
nnoremap <leader>d :NERDTreeTabsToggle<CR>
nnoremap <C-tab> :tabn<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <C-S-tab> :tabp<CR>
nnoremap <leader>p :tabp<CR>
nnoremap <A-left> :tabmove -1<CR>
nnoremap <A-right> :tabmove +1<CR>
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Split in the correct place...
set splitbelow
set splitright
" And sensible navigating between splits
nnoremap <C-j> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Copy/paste
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" Selecting regions
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Highlight syntax in programming languages
syntax enable

" Enable filetype detection
filetype plugin indent on

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader>f za
let g:SimpylFold_docstring_preview=1

" Hack to make the status line always show
set laststatus=2

" Fix mouse interaction when running through screen
set mouse=a

" Options for the syntastic plugin (just the recommended options from the syntastic README)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Always keep a few lines visible at the top/bottom of the screen.
set scrolloff=3

" Don't default to paste mode as it breaks YCM TAB support,
" but make it easy to turn on paste mode.
set pastetoggle=<F10>

set number

set shiftwidth=4
set softtabstop=4
set expandtab

set incsearch
set showmode
set hlsearch
set wildmode=full

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab
set smartindent

nnoremap <C-n> :tabnew<CR>
" Replacing searched text
vnoremap <C-i> "hy:%s/<C-r>h//gc<left><left><left>

" Copy / paste
inoremap <C-v> <ESC>"+gpi
map <S-Insert> "+gP

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-x> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-c> "+y
vnoremap <C-Insert> "+y

"cmap <C-V>  	<C-R>+
"cmap <S-Insert> 	<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"imap <S-Insert> 	<C-V>
"vmap <S-Insert> 	<C-V>

" Use CTRL-Q to do what CTRL-V used to do
"noremap <C-Q>   	<C-V>

" Move around different panes
nmap <M-S-Up> <C-w>+
nmap <M-S-Down> <C-w>-
nmap <M-S-Left> <C-w><
nmap <M-S-Right> <C-w>>
nmap <M-C-Right> <C-w><right>
nmap <C-M-Left> <C-w><left>

" Options for YCM
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Options for NERDTree tabs
" Open NERDTree on startup, but only when opening a directory
let g:nerdtree_tabs_open_on_gui_startup = 2
let NERDTreeIgnore = ['\.pyc$']
" Options for syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Options for CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
" Use git to find files when we're in a git project
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Make :Explorer mode look like nerdtree
let g:netrw_liststyle=3

" Use solarized
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
"if has('gui_running')
"    set background=dark
"    colorscheme solarized
"else
"    set background=dark
"endif

" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=DarkYellow guibg=DarkYellow

highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow

"augroup filetype
"  au! BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"augroup END

"if v:version >= 702
"  " Lines longer than 80 columns.
"  "au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
"
"  " Whitespace at the end of a line. This little dance suppresses
"  " whitespace that has just been typed.
"  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"  au InsertEnter * call matchdelete(w:m1)
"  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
"  au InsertLeave * call matchdelete(w:m2)
"  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"else
"  au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
"  au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
"  au InsertLeave * syntax match WhitespaceEOL /\s\+$/
"endif

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END
" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

augroup filetype
  au! BufRead,BufNewFile *.py set
      \ shiftwidth=4
      \ autoindent
      \ tabstop=4
      \ softtabstop=4
      \ textwidth=79
      \ expandtab
      \ fileformat=unix
augroup END

augroup filetype
  au! BufNewFile,BufRead *.js, *.html, *.css set
      \ tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to four spaces
command! Untab :%s/\t/    /g

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
 au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END

