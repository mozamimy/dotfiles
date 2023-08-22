" Line number
set number

" Tab space
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" Visualize tabs and trailing spaces
set list
set listchars=tab:^\ ,trail:~

" Manage plugin packages
packadd vim-jetpack
call jetpack#begin()
" Overall
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'neoclide/coc.nvim', { 'branch': 'release' }
Jetpack 'jiangmiao/auto-pairs'

" Style
Jetpack 'lifepillar/vim-solarized8', { 'branch': 'neovim' }
Jetpack 'itchyny/lightline.vim'

" Language independent
Jetpack 'hashivim/vim-terraform'
Jetpack 'google/vim-jsonnet'
call jetpack#end()

" Color scheme
syntax enable
set background=light
set termguicolors
colorscheme solarized8

" Terraform
let g:terraform_fmt_on_save=1

" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }

" { coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gre <Plug>(coc-rename)
nmap <silent> gra <Plug>(coc-codeaction-selected)
xmap <silent> gra <Plug>(coc-codeaction-selected)

" Show information of variable
" https://github.com/neoclide/coc.nvim/issues/869
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }

" Filetype
autocmd BufNewFile,BufRead *.scheme set filetype=ruby
