set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"Set the guifont
set guifont=Terminus\ (TTF):h14

"Mac Config
if has ('gui_macvim')
  macmenu Window.Select\ Previous\ Tab  key=<nop>
  macmenu Window.Select\ Next\ Tab      key=<nop>
  macmenu File.New\ Tab key=<nop>
  macmenu File.Close key=<nop>
  macmenu File.Open\.\.\. key=<nop>
  nmap <silent> <D-o> :NERDTreeToggle<CR>
  nmap <silent> <D-w> :bd<CR>
  nnoremap <D-j> <c-e>
  nnoremap <D-k> <c-y>
  nnoremap <D-p> <c-p>

endif

" Keys to navigate between splits
"nnoremap <silent> <c-s-h> :wincmd h<CR>
"nnoremap <silent> <c-s-j> :wincmd j<CR>
"nnoremap <silent> <c-s-k> :wincmd k<CR>
"nnoremap <silent> <c-s-l> :wincmd l<CR>

