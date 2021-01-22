syntax on                               " For syntax highlighting

colorscheme monokai                   " Set colorscheme from here
" colorscheme vim-monokai-tasty

set termguicolors                       " Actual bright color support
set t_Co=256                            " Support 256 colours in terminal.
                                        " No comment in the following line (?)

hi Normal guibg=NONE ctermbg=NONE       
                                        " Makes background same as terminal

set noerrorbells                        " No sounds on errors
set visualbell                          " Visual que on errors
set ruler                               " Shows cursor position

set tabstop=4 softtabstop=4 expandtab   " Sets tabs's width (tabs -> spaces)
set shiftwidth=4                        " Shifts 4 spaces (Indenting)(V + >)
set smartindent                         " Auto indents from indented line
set autoindent                          " Inherits indent from previous lines

set nu                                  " Shows line numbers
set number relativenumber               " Gives linenumbers relatively

set nowrap                              " Doesn't wrap text

set ignorecase                          " Disables case sensitive search
set smartcase                           " Enables case sensitive search on caps

set noswapfile                          " Disables swapfiles
set nobackup                            " Disables backups (undodir is set)
set undodir=~/.config/nvim/undodir      " Sets undodir (make this dir)
set undofile                            " Sets undofiles for every file

set incsearch                           " Enables incremental search
set hlsearch                            " Enables highlights for searches

set path+=**                            " Allows vim to look through files
set clipboard+=unnamedplus

filetype plugin on
set omnifunc=syntaxcomplete#Complete


" netrw settings
"-----------------------------------------------------------------------------

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

let g:netrw_banner = 0
let g:netrw_winsize = 20
" Calling plugins
call plug#begin('~/.config/nvim/autoload/plugged')
    
    Plug 'tpope/vim-fugitive'           " Git integration

    Plug 'mbbill/undotree'              " Gives a file changes tree

    Plug 'itchyny/lightline.vim'        " Status line plugin
    Plug 'crusoexia/vim-monokai'        " Monokai colorshceme
    Plug 'jiangmiao/auto-pairs'         " Gives automatic bracket pairs
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

