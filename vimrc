set encoding=utf-8
scriptencoding utf-8

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
augroup vimrc
  autocmd!
  autocmd WinEnter * match WhitespaceEOL /\s\+$/
augroup END

" タブ切り替えのショートカット
nnoremap <C-n> :tabn <Enter>
nnoremap <C-p> :tabp <Enter>

" 検索結果のハイライト
set hlsearch

" vim を終了しても undo できるように
if has('persistent_undo')
  set undofile
  set undodir=./.vimundo,~/.vim/undo
endif

" バックスペースでなんでも消す
set backspace=indent,eol,start

" カーソルキーでのウィンドウサイズ変更
nnoremap <silent><Down> <C-w>-
nnoremap <silent><Up> <C-w>+
nnoremap <silent><Left> <C-w><
nnoremap <silent><Right> <C-w>>

" .rbtclk に Ruby のシンタックスを適用
augroup rbtclk
  autocmd!
  autocmd BufRead,BufNewFile rbtclk,.rbtclk set filetype=ruby
augroup END

" マルチバイト文字でずれないように
set ambiwidth=double

" 変更されたときに自動で読み直す
set autoread

" golang用の設定
augroup golang
  autocmd!
  autocmd BufRead,BufNewFile *.go set noexpandtab tabstop=4 shiftwidth=4 nolist
augroup END

set completeopt-=preview
set completeopt+=longest

" Rust用の設定
augroup rust
  autocmd!
  autocmd BufRead,BufNewFile *.rs set tabstop=4 shiftwidth=4 filetype=rust
augroup END

"
" neobundle & plugins
"
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
filetype plugin on
NeoBundleCheck

" 全体の動作に関わるようなもの
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thinca/vim-quickrun'

" シンタックスハイライトとか
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'tpope/vim-markdown'

" Ruby とか Rails とか
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'

" golang
NeoBundle 'fatih/vim-go'

" Rust
NeoBundle 'rust-lang/rust.vim'

" memo
NeoBundle 'neilagabriel/vim-geeknote'

call neobundle#end()

"
" カラースキーム
"
syntax enable
set background=light
colorscheme solarized

"
" lightline の設定
"
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"
" unite の設定
"
let g:unite_enable_start_insert = 1

"
" neocomplete の設定
"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 2

"
" vim-coffee-script の設定
"
augroup vim-coffee-script
  autocmd!
  autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
  autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
augroup END

"
" vim-slim の設定
"
augroup vim-slim
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.slim set filetype=slim
augroup END

"
" vim-markdown の設定
"
augroup vim-markdown
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
augroup END

let g:markdown_fenced_languages = [
\ 'ruby',
\ 'sh',
\ 'javascript',
\ 'coffee',
\ 'css',
\ 'sass',
\ 'yaml',
\]
