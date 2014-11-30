" Pathogen + Basics
set nocompatible
execute pathogen#infect()
syntax on

" Airline
let g:airline_powerline_fonts=1

" Misc Vim settings
set number

set t_Co=256
set laststatus=2
set timeoutlen=50
set shell=bash

colorscheme jellybeans

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=23

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files=1
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"set complete=.,b,u,]

" Indent
filetype plugin indent on

set backspace=indent,eol,start
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
