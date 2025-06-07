" =============================================================================
" BASIC SETTINGS
" =============================================================================

set nocompatible                " Disable Vi compatibility mode
syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable filetype detection, plugins and indent

" =============================================================================
" LEADER KEY
" =============================================================================

let mapleader = " "             " Set leader key to spacebar

" =============================================================================
" FILE AND PATH SETTINGS
" =============================================================================

set path+=**                    " Search recursively in subdirectories
set wildignore+=*/node_modules/*,*/.git/*,*.pdf  " Ignore these patterns in file searches

" =============================================================================
" DISPLAY AND APPEARANCE
" =============================================================================

set relativenumber              " Show relative line numbers
set number                      " Show absolute line numbers
set scrolloff=8                 " Keep 8 lines visible above/below cursor
set cursorline                  " Highlight current line
set colorcolumn=80              " Show vertical line at 80 characters
highlight CursorLine ctermbg=235 guibg=#464646 cterm=NONE gui=NONE  " Custom cursorline colors

" =============================================================================
" INDENTATION AND TABS
" =============================================================================

set shiftwidth=4                " Number of spaces for auto-indent
set tabstop=4                   " Number of visual spaces per TAB
set expandtab                   " Convert tabs to spaces
set autoindent                  " Auto indent for new lines

" =============================================================================
" SEARCH SETTINGS
" =============================================================================

set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight search matches
set showmatch                   " Highlight matching brackets () {} []

" =============================================================================
" TEXT DISPLAY AND WRAPPING
" =============================================================================

set conceallevel=2              " Hide markup for bold/italic text formatting
set concealcursor=nc            " Apply conceal in normal and command mode
set linebreak                   " Break lines at word boundaries
set wrap                        " Wrap long lines

" =============================================================================
" SYSTEM INTEGRATION
" =============================================================================

set wildmenu                    " Enable enhanced command completion
set wildmode=list:longest,full  " Command completion behavior
set laststatus=2                " Always show status line
set statusline=%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P  " Status line format
set clipboard=unnamed           " Use system clipboard
set termguicolors               " Enable 24-bit RGB colors
set undofile                    " Persistent undo
set undodir=~/.vim/undo//       " Undo files directory
set backupdir=~/.vim/backup//   " Backup files directory

" Create directories if they don't exist
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p", 0700)
endif

set noswapfile                  " Disable swap file creation

" =============================================================================
" BUFFER NAVIGATION
" =============================================================================

" Toggle between current and previous buffer
nnoremap <leader><leader> <C-^>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" Save all buffers and quit
nnoremap <leader>q :wall<bar>qall<CR>

" Show buffer list and prompt for selection
nnoremap <leader>b :ls<CR>:b<Space>

" Navigate between buffers
nnoremap <leader>bn :bnext<CR>      " Next buffer
nnoremap <leader>bp :bprevious<CR>  " Previous buffer

" Quick save
nnoremap <leader>w :w<CR>

" File search with FZF
nnoremap <leader>f :Files<CR>         " Fuzzy find files
nnoremap <leader>F :GFiles<CR>        " Git files only

" Search in files with FZF + Ripgrep
nnoremap <leader>ff :Rg<CR>           " Interactive search in files
nnoremap <leader>fw :Rg <C-r><C-w><CR> " Search word under cursor
nnoremap <leader>fo :copen<CR>        " Open quickfix (still useful)
nnoremap <leader>fc :cclose<CR>       " Close quickfix

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv     " Move selection down
vnoremap K :m '<-2<CR>gv=gv     " Move selection up

" =============================================================================
" HTML INDENTATION
" =============================================================================

let g:html_indent_script1 = "inc"    " Increase indent for script tags
let g:html_indent_style1 = "inc"     " Increase indent for style tags
let g:html_indent_inctags = "html,body,head"  " Tags that increase indent

" =============================================================================
" CLIPBOARD OPERATIONS
" =============================================================================

" System clipboard operations
noremap <Leader>y "*y           " Yank to system clipboard
noremap <Leader>p "*p           " Paste from system clipboard
noremap <Leader>Y "+y           " Yank to selection clipboard
noremap <Leader>P "+p           " Paste from selection clipboard

" =============================================================================
" FILETYPE SPECIFIC MAPPINGS
" =============================================================================

" Language-specific indentation
autocmd FileType javascript,typescript setlocal ts=2 sw=2 sts=2
autocmd FileType json,yaml setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal ts=4 sw=4 sts=4

" Markdown: follow link under cursor with Ctrl+b
autocmd FileType markdown nmap <C-b> gf

" =============================================================================
" NETRW FILE EXPLORER SETTINGS
" =============================================================================

let g:netrw_banner = 0          " Disable banner at top of netrw
let g:netrw_browse_split = 4    " Open files in previous window
let g:netrw_altv = 1            " Open vertical splits to the right
let g:netrw_liststyle = 3       " Use tree-style listing
let g:netrw_winsize = 50        " Set netrw window size
let g:netrw_keepdir = 0         " Auto-update netrw directory listing
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " Hide dotfiles

" Quick access to file explorer
nnoremap <leader>e :Explore<CR>

" =============================================================================
" NETRW TOGGLE FUNCTION
" =============================================================================

function! ToggleNetrw()
  for w in range(1, winnr('$'))
    let buf = winbufnr(w)
    if getbufvar(buf, '&filetype') ==# 'netrw'
      if winnr() != w
        " Netrw is open, move focus to it
        execute w . "wincmd w"
        return
      else
        " Netrw is focused, close it
        execute w . "wincmd c"
        return
      endif
    endif
  endfor
  " Netrw not open — open it in a narrow left split
  execute 'leftabove 40vsplit .'
endfunction

" Toggle netrw file explorer
nnoremap <leader>1 :call ToggleNetrw()<CR>

" In netrw, press Esc to move focus to main window
autocmd FileType netrw nnoremap <buffer> <Esc> <C-w>l

" =============================================================================
" SEARCH TOOL CONFIGURATION
" =============================================================================

" Configure ripgrep as grep program
set grepprg=rg\ --vimgrep\ --smart-case\ --glob\ '!*.pdf'
set grepformat=%f:%l:%c:%m      " Format for grep output

" =============================================================================
" FZF CONFIGURATION
" =============================================================================

" FZF layout and appearance
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" FZF colors to match vim colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" =============================================================================
" PLUGIN MANAGEMENT
" =============================================================================

call plug#begin('~/.vim/plugged')
    Plug 'vimwiki/vimwiki'      " Personal wiki for Vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'     " FZF integration for Vim
call plug#end()

" =============================================================================
" SEARCH MAPPINGS AND FUNCTIONS
" =============================================================================

" Navigate search results (for quickfix compatibility)
nnoremap <Leader>n :cnext<CR>zz       " Next result (centered)
nnoremap <Leader>p :cprev<CR>zz       " Previous result (centered)

" =============================================================================
" CUSTOM SEARCH FUNCTION
" =============================================================================

" Note: CustomGrep replaced by FZF :Rg command
" Use <leader>ff for interactive search instead