" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Install plugins
call plug#begin()
" Git
Plug 'kdheepak/lazygit.nvim'

" Search/Find
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
call plug#end()

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

set number " Add number lines

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
