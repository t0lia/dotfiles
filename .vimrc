execute pathogen#infect()
syntax on
filetype plugin indent on

filetype indent on

set relativenumber      " show relative line number

set shiftwidth=4
set tabstop=4           " number of visual spaces per TAB
set expandtab           " tabs are spaces
set autoindent          " auto indent for new line

set showmatch           " higlight matching () {} []

" SEARCH
set incsearch           " search as character entered
set hlsearch            " hightlight matches

set foldenable          " enable folding
set foldmethod=indent   " fold based in indent level
set noswapfile          " not use swap file

let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head"

map <C-n> :NERDTreeToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
highlight Folded ctermbg=black ctermfg=darkgrey
highlight LineNr ctermfg=darkgrey
