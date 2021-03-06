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

" カレント行をハイライトしない
set nocursorline

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

" インデント付けて折り返すやつ
set breakindent

" カーソルキーでのウィンドウサイズ変更
nnoremap <silent><Down> <C-w>-
nnoremap <silent><Up> <C-w>+
nnoremap <silent><Left> <C-w><
nnoremap <silent><Right> <C-w>>

" 空行をいい感じに入れる
" http://vim-jp.org/vim-users-jp/2009/08/15/Hack-57.html
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" きびきび動くように
set lazyredraw
set ttyfast

" .rbtclk に Ruby のシンタックスを適用
augroup rbtclk
  autocmd!
  autocmd BufRead,BufNewFile rbtclk,.rbtclk set filetype=ruby
augroup END

" *.schema に Ruby のシンタックスを適用
augroup schema
  autocmd!
  autocmd BufRead,BufNewFile *.schema set filetype=ruby
augroup END

" Grantfile, *.grant に Ruby のシンタックスを適用
augroup grantfile
  autocmd!
  autocmd BufRead,BufNewFile Grantfile,*.grant set filetype=ruby
augroup END

" .iam に Ruby のシンタックスを適用
augroup iam
  autocmd!
  autocmd BufRead,BufNewFile *.iam set filetype=ruby
augroup END

" Routetable, .rtbl に Ruby のシンタックスを適用
augroup rtbl
  autocmd!
  autocmd BufRead,BufNewFile Routetable,*.rtbl set filetype=ruby
augroup END

" Groupfile, *.group に Ruby のシンタックスを適用
augroup security_group
  autocmd!
  autocmd BufRead,BufNewFile Groupfile,*.group set filetype=ruby
augroup END

" Vagrantfile に Ruby のシンタックスを適用
augroup vagrantfile
  autocmd!
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" Nymphia, *.nym.rb に Ruby のシンタックスを適用
augroup nymphiafile
  autocmd!
  autocmd BufRead,BufNewFile Nymphia,*.nym.rb set filetype=nymphia
augroup END

" ELBfile, *.elb に Ruby のシンタックスを適用
augroup elbfile
  autocmd!
  autocmd BufRead,BufNewFile ELBfile,*.elb set filetype=ruby
augroup END

" *.toml に TOML のシンタックスを適用
augroup tomlfile
  autocmd!
  autocmd BufRead,BufNewFile *.toml set filetype=toml
augroup END

" *.jsonnet, *.libsonnet に Jsonnet のシンタックスを適用
augroup jsonnet
  autocmd!
  autocmd BufRead,BufNewFile *.jsonnet,*libsonnet set tabstop=2 shiftwidth=2 filetype=jsonnet
augroup END

" *.tf に Terraform のシンタックスを適用
augroup terraform
  autocmd!
  autocmd BufRead,BufNewFile *.tf set tabstop=2 shiftwidth=2 filetype=terraform
augroup END

" マルチバイト文字でずれないように
set ambiwidth=double

" 変更されたときに自動で読み直す
set autoread

set completeopt-=preview
set completeopt+=longest

" golang用の設定
augroup golang
  autocmd!
  autocmd BufRead,BufNewFile *.go set noexpandtab tabstop=4 shiftwidth=4 nolist
augroup END

" Rust用の設定
augroup rust
  autocmd!
  autocmd BufRead,BufNewFile *.rs set tabstop=4 shiftwidth=4 filetype=rust
  autocmd FileType rust nmap gd <Plug>(rust-def)
  autocmd FileType rust nmap gs <Plug>(rust-def-split)
  autocmd FileType rust nmap gx <Plug>(rust-def-vertical)
augroup END

" Javascript
augroup js
  autocmd!
  autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 filetype=javascript
augroup END

" 開いているファイルのパスをだすやつ
command CurrentFilePath echo expand("%:p")

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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'simeji/winresizer'

" シンタックスハイライトとか
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'puppetlabs/puppet-syntax-vim'
NeoBundle 'rhysd/vim-gfm-syntax'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'mozamimy/nymphia.vim'
NeoBundle 'mozamimy/itamae.vim'
NeoBundle 'itkq/fluentd-vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'google/vim-jsonnet'

" Ruby とか Rails とか
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'mrkn/vim-cruby'

" golang
NeoBundle 'fatih/vim-go'

" Rust
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'

" JavaScrpit
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

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

"
" puppet-syntax-vim の設定
"
augroup puppet-syntax-vim
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.pp set filetype=puppet
augroup END

"
" vimfiler.vim の設定
"
nnoremap <C-f> :VimFiler <Enter>

"
" racer-rust/vim-racer の設定
"
let g:racer_cmd = $HOME . '/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
