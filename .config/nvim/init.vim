" Put this file inside ~/.config/nvim/
" To install vim-plug run:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" To install the plugins run:
" :PlugInstall
" To update the plugins run:
" :UpdateRemotePlugins
" To use :Rg for fzf you need to install ripgrep (use brew instead of apt if on Mac)
" apt install ripgrep
" Might need to install pynvim and jedi to your global environment
" /home/jeacaveo/anaconda3/bin/python3 -m pip install pynvim jedi

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vcscommand.vim'
Plug 'pacha/vem-tabline'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'liuchengxu/graphviz.vim'

Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

call plug#end()

colorscheme gruvbox

" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-jedi
" to fix compile error run: pip install pynvim jedi
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" jedi-vim
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" neomake
let g:neomake_python_enabled_makers = ['pylint', 'mypy']
call neomake#configure#automake('nrwi', 2500)
let g:neomake_open_list = 2

"jump to the last position when reopening a file
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
set colorcolumn=120
set hidden
 
" color support
set background=dark
set t_Co=256
let g:ophigh_color = 244
let g:ophigh_color_gui = "#A8A8A8"

" search
" \space = hides/shows search highlight
nnoremap <silent> <Leader><Space> :call gruvbox#hls_toggle()<CR>
inoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>a
vnoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>gv
nnoremap <silent> <CR> :call gruvbox#hls_hide()<CR><CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>? 
 
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
 
 
" pep8
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ruler
set number
set hls

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
 
" NERDTree
" \n = start NERDTree
map <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" MarkdownPreview
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>

" Black
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 120

" Fuzzy Search (fzf)
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Rg<CR>

" Perl
:let g:loaded_perl_provider = 0

" Python (Change to your username)
let g:python3_host_prog = '/home/jeacaveo/miniconda3/bin/python3'

" Copilot Chat
nnoremap <silent> <leader>cc :CopilotChat<CR>

" require('copilot').setup({
"     suggestion = { enabled = true },
"     panel = { enabled = true },
" })
"
"
lua << EOF
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
EOF
