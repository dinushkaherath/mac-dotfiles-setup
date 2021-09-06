set number
set relativenumber
nnoremap <space> <NOP>
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'easymotion/vim-easymotion'
PlugIn 'vim-scripts/indentpython.vim'


" Initialize plugin system
call plug#end()

let mapleader = " "

"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

nnoremap <c-p> :GFiles --cached --others --exclude-standard<cr>
map <leader>go :GFiles --cached --others --exclude-standard<cr>
map <leader>gm :GFiles --cached --others --exclude-standard app/models<cr>
map <leader>gv :GFiles --cached --others --exclude-standard app/views<cr>
map <leader>gc :GFiles --cached --others --exclude-standard app/controllers<cr>

"quit files with leader q
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :w<cr>

"get to Ack quickly with leader a
nnoremap <leader>a :Ack
"ack on the word under the cursor
map <leader>k :Ack <C-R><C-W><CR>


let g:ackprg = 'rg --vimgrep --no-heading'

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"get out of insert mode
inoremap jj <ESC>
inoremap jk <ESC>

"some stuff for easy tabs
map <C-t> <esc>:tabnew<cr>
"move back and forth with tabs
noremap <S-l> gt
noremap <S-h> gT

imap <c-l> <space>=><space>

"switch to the last file
nnoremap <leader><leader> <c-^>

"easymotion settings
let g:EasyMotion_do_mapping = 0 "disable all mapping
let g:EasyMotion_smartcase = 1 "case insensitive

nmap s <Plug>(easymotion-overwin-f2)

if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za
"


filetype indent on
:set shiftwidth=4



" Python tabs and spacing
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix



