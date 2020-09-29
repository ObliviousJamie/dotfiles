"fzf settings
"""""""""""""

"Set vim to replace vimgrep grep engine with ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

"Enable quick find shortcuts using fuzzy search
"Ctrl-p searchs all files in directory
"Ctrl-t does a grep search 
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-t> :Rg<CR>

"gutentags setting
"""""""""""""""""

"Make gutentags only tag files not inside .gitignore 
if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
endif
