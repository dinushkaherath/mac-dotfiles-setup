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




" Initialize plugin system
call plug#end()

let mapleader = " "

"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j



nnoremap <c-p> :GFiles --cached --others --exclude-standard<cr>


"quit files with leader q
nnoremap  <leader>q :q<cr>

"get to Ack quickly with leader a
nnoremap <leader>a :Ack
"ack on the word under the cursor
map <leader>k :Ack <C-R><C-W><CR>


"let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore-dir log --ignore-dir versions'
let g:ackprg = 'rg --vimgrep --no-heading'



nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>


"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

