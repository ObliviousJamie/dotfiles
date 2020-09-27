function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

"Toggle statusline
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

"Set statusline
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
