execute pathogen#infect()

syntax enable
filetype plugin indent on
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Always show current position
set ruler

"Always show line numbers with a min width of four characters
set number
set numberwidth=4

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Default tab indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Set Python to 4 space indentation
autocmd Filetype python setlocal sw=4 ts=4 sts=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""
" => Miscellaneous Commands
""""""""""""""""""""""""""""""
" Open NERDTree autuomatically
map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" => VIM status bar layout
"""""""""""""""""""""""""""""'

" Colour profiles
hi User1 ctermbg=black ctermfg=red   guibg=black guifg=red
hi User2 ctermbg=black   ctermfg=blue  guibg=black   guifg=blue
hi User3 ctermbg=black  ctermfg=green guibg=black  guifg=green
hi User4 ctermbg=black  ctermfg=cyan guibg=black  guifg=cyan
" Left

" Set the fg colour red
set statusline=%1*
" Tail of the filename
set statusline+=%t

" File encoding
" Set the fg colour blue
set statusline+=%2*
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},
" File format
set statusline+=\ %{&ff}]\  

" Set the fg colour green
set statusline+=%3*
" Filetype
set statusline+=%y\  

" Set the fg colour cyan
set statusline+=%4*
" Help file flag
set statusline+=%h\  
" Modified flag
set statusline+=%m\  
" Read only flag
set statusline+=%r\  

" Left / right separator
set statusline+=%=\  

" Right
" Set the fg colour red
set statusline+=%1*
" Cursor column
set statusline+=%c\  

" Set the fg colour blue
set statusline+=%2*
" Cursor line / total lines
set statusline+=%l/%L\  

" Set the fg colour green
set statusline+=%3*
" Percent through the file
set statusline+=\ %P\  

" Set the fg colour cyan
set statusline+=%4*
" Display the size of the current file being edited
set statusline+=\<%{FileSize()}\> 

" Function to determine size of current file
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction
