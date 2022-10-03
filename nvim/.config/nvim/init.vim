set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua <<EOF
require('telecope').load_extension('fzf')
EOF
