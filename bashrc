# Homebrew
export PATH="/Users/flost/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin":$PATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman":$MANPATH

# texbin
export PATH="/usr/texbin":$PATH

# prompt
export PS1="[\#]\u@\h:\[\033[32m\]\W\[\033[0m\]> "

# language
export LANG=en_US.UTF-8

# customization of ls command
export LS_COLORS='no=00:fi=00:di=03;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.xz=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
alias ls='ls -N --color=tty -T 0'

# customization of grep command
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# make a directory and move there
function mkdirr() {
  local aliased_current_dir=$(pwd)
  local current_dir=$(pwd -P)
  local slash=/

  cd $current_dir
  mkdir $1

  cd $aliased_current_dir$slash$1
}

# search
function search_in_file() {
  find . -name "*.$1" -print | xargs grep "$2"
}

# postgresql
export PGDATA=/usr/local/var/postgres
alias run_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stop_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log -m fast stop"

# mongodb
alias mongod="mongod --config /usr/local/etc/mongod.conf"

# mount remote machine
alias mount_malice="sshfs malice:/home/flost ~/mnt/malice"
alias mount_sh_malice="sshfs sh_malice:/home/flost ~/mnt/sh_malice"
alias mount_alice="sshfs alice:/home/flost ~/mnt/alice"
alias mount_sh_queen="sshfs sh_queen:/var/storage1 ~/mnt/queen"
alias mount_queen1="sshfs queen:/var/storage1 ~/mnt/queen"
alias mount_queen2="sshfs queen:/var/storage2 ~/mnt/queen"

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin

# bundle exec
alias be="bundle exec"
alias bes="bundle exec"

# git compl.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# vim
alias vim_sjis="vim -c ':e ++enc=sjis'"
alias vim_cp932="vim -c ':e ++enc=cp932'"
alias vim_euc="vim -c ':e ++enc=euc-jp'"

# C/C++ compiler
export CC="/usr/local/bin/gcc-4.9"
export CXX="/usr/local/bin/gcc-4.9"