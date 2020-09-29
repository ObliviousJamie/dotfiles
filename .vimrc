"Can leave buffer without saving
set hidden 
"Live regex highlighting
set incsearch 
"Ctrl-X/Ctrl-A can increment letters too
set nrformats+=alpha 
"Set case insensitive search, except when using capital letters
set ignorecase smartcase 
"Set line numbers
set number relativenumber
"Bind ] in normal mode to go back from a tag jump
nnoremap ] :pop <CR>

if !exists('g:vscode')
	"Use build in color scheme
	colorscheme elflord
	"Syntax highlighting
	syntax on

	source $HOME/.config/nvim/statusline.vim
	source $HOME/.config/nvim/pluginconf.vim
	source $HOME/.config/nvim/terminal.vim
	
	call plug#begin('~/.vim/plugged')
	
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'ludovicchabant/vim-gutentags'
	
	call plug#end()
endif
