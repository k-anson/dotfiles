" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Install plugins
call plug#begin()
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'm4xshen/autoclose.nvim'
" Plug 'safv12/andromeda.vim'
Plug 'folke/tokyonight.nvim'
call plug#end()

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Add number lines
set number

" Use spaces for tab indents
" Set indent width to 2 spaces
set shiftwidth=2 smarttab
set expandtab

" Enable Matchit
runtime macros/matchit.vim

" Map leader to Space
nnoremap <SPACE> <Nop>
let mapleader = " "

" LazyGit command-line sugar
nnoremap <leader>gg :LazyGit<cr>

" Find files using Telescope command-line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nvim Tree
nnoremap <C-t> :NvimTreeToggle<CR>

" CoC
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
nmap <leader>qf <Plug>(coc-fix-current)

" Andromeda
syntax on
" set background=dark
colorscheme tokyonight
