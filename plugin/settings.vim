set number relativenumber
set numberwidth=1
syntax enable
set clipboard=unnamedplus
set mouse=a
set guicursor=a:block
set showcmd
set ruler
set encoding=utf-8
set inccommand=split
set showmatch
set sw=2
set colorcolumn=81
set number
set signcolumn=number
set linebreak
set wrap
set noswapfile
set nohlsearch
set ignorecase
set termguicolors

set fillchars=fold:\ | set foldtext=CustomFold() " Minimalistic folding
set listchars=tab:\│\ ,trail:· list "Alternate tab: »>


" Gruvbox por defecto
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

" Nerd Tree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" Easy motion
nmap <Leader>s <Plug>(easymotion-s2)

nmap <Leader>h :tabprevious<CR>
nmap <Leader>l :tabnext<CR>

