let mapleader = ","

" jj to leave insertmode
imap jj <Esc>

" Append ; at end of line
nnoremap ; :execute "normal! mqA;\<lt>esc>`q"<enter>

" record macro to q
nnoremap Q qq

" Close split but keep buffer
nnoremap <Backspace> <C-w>q<Enter>

" swap lines
nnoremap - ddpkj
nnoremap _ kddpk

" save to disk
nnoremap <Enter> :w<Enter>
nnoremap <leader><Enter> :w !sudo tee %<Enter>

" closing / exiting
nnoremap <leader>q :bw<Enter>
nnoremap <leader>a :qa<Enter>

" change split direction
nnoremap <leader>bs :split<Enter>
nnoremap <leader>vs :vsplit<Enter>

" make session
nnoremap <leader>mks :mks!<Enter>

" center current line
nnoremap <leader>. z.

" buffer cycling
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Sort like a boss
vnoremap <C-s> :sort<CR>

" Blackhole pasting
vnoremap <leader>p "_dP

" Set filetype to json and apply correct formatting
nnoremap =j :set ft=json<CR>:%!python -m json.tool<CR>

" Replace all occurences
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
vnoremap <leader><C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>
