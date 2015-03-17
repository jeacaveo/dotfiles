" Install/configuration instructions:
"
" Initial directories:
" mkdir ~/.vim/
" mkdir ~/.vim/{autoload,bundle}
" cd ~/.vim/
" git init
"
" Install Pathogen
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" Install plugins:
" git submodule add https://github.com/ervandew/supertab.git bundle/supertab
" git submodule add https://github.com/wincent/Command-T.git bundle/command-t
" git submodule add https://github.com/mitechie/pyflakes-pathogen.git bundle/pyflakes-pathogen
" git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
" git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
" git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
" git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
" git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
" git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
" git submodule add https://github.com/klen/rope-vim.git bundle/ropevim
" git submodule add https://github.com/Valloric/vim-operator-highlight bundle/vim-operator-highlight
" git submodule add https://github.com/vim-scripts/vcscommand.vim bundle/vcscommand
" git submodule add https://github.com/bling/vim-airline bundle/vim-airline
" git submodule add https://github.com/jmcantrell/vim-virtualenv bundle/vim-virtualenv
" git submodule add https://github.com/scrooloose/syntastic bundle/syntastic
" git submodule init
" git submodule update
" git submodule foreach git submodule init
" git submodule foreach git submodule update
" 
" Install/configure color scheme:
" mkdir ~/.vim/colors
" cp ~/.virtualenv/src/dotfiles/autoload/gruvbox.vim ~/.vim/autoload/
" cp ~/.virtualenv/src/dotfiles/colors/gruvbox.vim ~/.vim/colors
"
" Compile commant-t:
" cd ~/.vim/bundle/commant-t/
" rake make





" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below. If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed. It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
 
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
 
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
 
"Jjump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
 
" Vim advanced functionality
set showcmd " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite " Automatically save before commands like :next and :make
set laststatus=2
set colorcolumn=79
set paste
 
" color supoort
set background=dark
set t_Co=256
colorscheme gruvbox
let g:ophigh_color = 244
let g:ophigh_color_gui = "#A8A8A8"

" Other colorschemes
" colorscheme codeschool
" colorscheme Distinguished
" colorscheme harlequin
" colorscheme monokai
" colorscheme github

" search
" \space = hides/shows search highlight
nnoremap <silent> <Leader><Space> :call gruvbox#hls_toggle()<CR>
inoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>a
vnoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>gv
nnoremap <silent> <CR> :call gruvbox#hls_hide()<CR><CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>? 
 
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif
 
" Activated pathogen
call pathogen#infect()
call pathogen#helptags()
 
" folding
" za = open/close fold
" zM = fold all
" zR = unfold all
" zr = unfold by level
set foldmethod=indent
set foldlevel=99
 
" tasklist
" \td = enter tasklist
" q = close tasklist
map <leader>td <Plug>TaskList
 
" To navigate wrapped lines
:nmap j gj
:nmap k gk

" Command line Bash like behavior
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" window splits
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
 
" revision history
" \g = start Gundo
map <leader>g :GundoToggle<CR>
let g:gundo_width = 80
let g:gundo_preview_height = 32
let g:gundo_right = 1
 
" syntax highlighting and validation
syntax on " syntax highlighing
filetype on " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype
 
" pep8
" F5 = validate pep8
" F4 = remove trailing whitespaces
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ruler
set number
set hls
let g:syntastic_python_checker_args='--ignore=E501'
" let g:pep8_ignore='E501' " Does not work for some reason
" let g:pep8_map='<leader>8'


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
 
" \l = toggle display of whitespace
nmap <leader>l :set list!<CR>
" " And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬

" Buffer navigation
" F8 = next
" F7 = previous
nnoremap <silent> <F8> :bn<CR>
nnoremap <silent> <F7> :bp<CR>
" Ctrl + n = next
" Ctrl + p = previous
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>
 
" code completion and documentation
" \pw = launch documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
 
" Syntax highlight (To avoid use of quickfix window)
let g:pyflakes_use_quickfix = 0
 
" NOTE: snipmate disabled since is overwriting tab and supertab behavior
 
" NERDTree
" \n = start NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
 
" Rope
" \j = go to definition
" \r = rename
" \d = showdocs
" Ctrl + c + r + o = organize imports
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>d :RopeShowDoc<CR>
" C-c r o RopeOrganizeImports
 
" \t = start file search (command-t)

" Airline tabs
let g:airline#extensions#tabline#enabled = 1
 
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,
    'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
