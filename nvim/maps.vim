" Description: Keymaps
cnoremap Q q!
cnoremap W w
nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

function! Termpy()
  exec winheight(1)/4."split" | terminal python3 -i %
endfunction

function! TermpyNormal()
  exec "!python3 %"
endfunction

func! CompileRunCode()
	exec "w"
	if &filetype == 'java'
		silent! exec "!clear"
		exec "!javac %"
		"silent! exec "!clear"
		"exec "!java -cp %:p:h %:t:r"
		exec winheight(1)/4."split" | terminal java -cp %:p:h %:t:r
		silent! exec "!mkdir -p .CLASSFILES"
		silent! exec "!mv *.class .CLASSFILES"
	elseif &filetype == 'vim'
		exec "so %"
	elseif &filetype == 'c'
		"silent! exec "!clear"
		"silent! exec "!gcc % -o %<"
		exec "!gcc % -o %<"
		"exec "!./%<"
        exec winheight(1)/4."split" | terminal ./%<
	elseif &filetype == 'c++'
		"silent! exec "!clear"
		"silent! exec "!g++ % -o %<"
		exec "!g++ % -o %<"
		"exec "!./%<"
        exec winheight(1)/4."split" | terminal ./%<
	elseif &filetype == 'cpp'
		silent! exec "!clear"
	    exec "!g++ % -o %<"
        exec winheight(1)/4."split" | terminal ./%<
		"exec "!./%<"
	elseif &filetype == 'python'
    call Termpy()
	elseif &filetype == 'py'
    call Termpy()
	elseif &filetype == 'javascript'
		silent! exec "!clear"
		exec "!node %"
	endif
endfunc

nnoremap <F5> :call CompileRunCode()<CR>
inoremap <F5> :call CompileRunCode()<CR>
nnoremap <F6> :call TermpyNormal()<CR>

inoremap / /<C-x><C-f>

