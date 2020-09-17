"Can leave buffer without saving
set hidden 

"Live regex highlighting
set incsearch 

"Ctrl-X/Ctrl-A can increment letters too
set nrformats+=alpha 

"Set case insensitive search, except when using capital letters
set ignorecase smartcase 

"Use build in color scheme
colorscheme elflord

"Set vim to replace vimgrep grep engine with ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

"Set line numbers
set number relativenumber

"Enable quick find shortcuts using fuzzy search
"Ctrl-p searchs all files in directory
"Ctrl-t does a grep search 
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-t> :Rg<CR>

"Enable blockstyle cursor (might not work depending on environment)
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

"Set status line
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#DiffChange#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{toupper(&fileencoding?&fileencoding:&encoding)}
set statusline+=\ %{toupper(&fileformat)}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%m
set statusline+=\ 
set statusline+=%#DiffChange#
set statusline+=\ %Y
set statusline+=\ 

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
