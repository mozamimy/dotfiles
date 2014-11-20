" vi コンパチを殺す
set nocompatible

" スワップファイルとバックアップファイル
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" モードライン
set modeline

" 行番号
set number

" 常にステータスラインを表示
set laststatus=2

" カレント行をハイライト
set cursorline

" タブ幅とインデント
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" 10 進数として数字をインクリメント
set nrformats=

" タブを可視化
set list
set listchars=tab:^\ ,trail:~

" 行末スペースを可視化
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" タブ切り替えのショートカット
map <C-n> :tabn <Enter>
map <C-p> :tabp <Enter>

" 検索結果のハイライト
set hlsearch

" vim を終了しても undo できるように
if has('persistent_undo')
  set undofile
  set undodir=./.vimundo,~/.vim/undo
endif

"
" neobundle の設定
"
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin on
NeoBundleCheck

"
" プラグイン
"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'itchyny/lightline.vim'

"
" カラースキーム
"
syntax enable
set background=light
colorscheme solarized

"
" vim-rails の設定
"
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END

"
" unite と unite-rails の設定
"
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H> :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H> :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H> :<C-U>Unite rails/controller<CR>

  nnoremap <buffer><C-H>c :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END

"
" vim-coffee-script の設定
"
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"
" indent-guides の設定
"
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=6
hi IndentGuidesEven ctermbg=13
" au FileType coffee,ruby,javascript,python,slim IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

"
" vim-slim の設定
"
au BufRead,BufNewFile,BufReadPre *.slim   set filetype=slim

"
" vim-rspec の設定
"
let g:rspec_command = "bundle exec rspec"

"
" lightline の設定
"
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
