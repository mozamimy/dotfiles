###########################
# Configurations for PATH #
###########################

if [ `uname` = "Darwin" ]; then
  # Homebrew and coreutils
  export PATH="${HOME}/bin:/opt/brew/bin:/opt/brew/sbin:/opt/brew/opt/coreutils/libexec/gnubin:/opt/brew/opt/go/libexec/bin":$PATH
  export MANPATH="/opt/brew/opt/coreutils/libexec/gnuman":$MANPATH

  # texbin
  export PATH="/usr/texbin":$PATH
fi

if [ `uname` = "Linux" ]; then
  export PATH="/home/$USER/bin":$PATH
fi

# Cargo
export PATH=$HOME/.cargo/bin:$PATH

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# bash compl.
if [ `uname` = "Darwin" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
      source `brew --prefix`/etc/bash_completion.d/vagrant
  fi
fi

# Golang
export GOPATH=$HOME/var/go
export PATH=$GOPATH/bin:$PATH

export SHELL=`which bash`
export GPG_TTY=$(tty)

###########
# Display #
###########

if [ `uname` = "Linux" ]; then
  source /usr/share/git/git-prompt.sh
fi

if [ ${EUID:-${UID}} = 0 ]; then
  # root
  export PS1='\[\033[31m\][\t]\u@\h:\[\033[32m\]\W\[\033[0m\]# '
else
  # not root
  export PS1='[\t]\u@\h:\[\033[32m\]\W\[\033[0m\]\[\e[0;34m\]$(__git_ps1)\[\e[00m\] \[\e[0;35m\](-'\''x'\''-).oO( \[\e[00m\]\n> '
fi

# language
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8

# customization of ls command
export LS_COLORS='no=00:fi=00:di=03;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.xz=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
alias ls='ls -N --color=tty -T 0'

# VI MODE!
set -o vi

###########
# Aliases #
###########

# customization of grep command
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

if [ `uname` = "Darwin" ]; then
  # postgresql
  export PGDATA=/usr/local/var/postgres
  alias run_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
  alias stop_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log -m fast stop"
fi

# mongodb
alias mongod="mongod --config /usr/local/etc/mongod.conf"

# ruby, rails
alias be="bundle exec"
alias brs="bundle exec rails s"
alias brc="bundle exec rails c"
alias br="bundle exec rake"

# vim
alias vim_sjis="vim -c ':e ++enc=sjis'"
alias vim_cp932="vim -c ':e ++enc=cp932'"
alias vim_euc="vim -c ':e ++enc=euc-jp'"
alias vim_iso="vim -c ':e ++enc=iso-2022-jp'"
alias v="vim"
alias sv="sudo vim"

# git
alias gbsut="git branch --set-upstream-to"
alias cdg='cd "$(git rev-parse --show-toplevel)"'

# file and directory
alias l="ls"
alias la="ls -a"
alias ll="ls -al"
alias rmr="rm -r"
alias rmrf="rm -rf"

if [ `uname` = "Darwin" ]; then
  alias funlock="chflags nouchg"
  alias flock="chflags uchg"
fi

# tmux hack for some commands
if [ `uname` = "Darwin" ]; then
  if [ -n "$TMUX" ]; then
    alias open="reattach-to-user-namespace -l open"
    alias osascript="reattach-to-user-namespace osascript"
    alias pbcopy="reattach-to-user-namespace pbcopy"
    alias pbpaste="reattach-to-user-namespace pbpaste"
  fi
fi

# etc
alias nomad53="envchain aws-personal-admin nomad53 en5 ZB3J3CGDM0KPR me.mozami.me"

# cookpad
alias launch_proxy="ssh -fN awsproxy.vpc"
alias kill_proxy="pkill -f 'ssh -fN awsproxy.vpc'"
alias spec_setup="bundle exec rake cookpad:spec:setup[4]"

# aws credential
export AWS_REGION=ap-northeast-1
alias ec="envchain aws-cookpad"
alias ecbe="envchain aws-cookpad bundle exec"
alias eb="envchain aws-bargain"
alias ebbe="envchain aws-bargain bundle exec"
alias ed="envchain aws-cookpad-dev"
alias edbe="envchain aws-cookpad-dev bundle exec"
alias ep="envchain aws-personal-admin"
alias epbe="envchain aws-personal-admin bundle exec"

#############
# Utilities #
#############

# Post to Slack
alias toot="envchain ckpd-slack-webhook toot"
alias toot-infra="envchain ckpd-slack-webhook toot \"#infra\""
alias toot-mozamimy-memo="envchain ckpd-slack-webhook toot \"#mozamimy-memo\""

# make a directory and move into it
function mkdirr() {
  local aliased_current_dir=$(pwd)
  local current_dir=$(pwd -P)
  local slash=/

  cd $current_dir
  mkdir $1

  cd $aliased_current_dir$slash$1
}

# change commiting timestamps for git
function change_commit_tm() {
  git commit --amend -C HEAD --date=$1
}

# find binaries using old libraries.
function rps() {
  sudo lsof +c 0 | grep -w DEL | awk '1 { print $1 ": " $NF }' | sort -u
}

# say with specified lines
function say_range() {
  sed -n "$1,$2p" $4 | say $3
}

# notify on OS X
function notify() {
  osascript -e "display notification \"$1\""

  if [ -n "$TMUX" ]; then
    reattach-to-user-namespace say $1
  else
    say $1
  fi
}

# get rds endpoint (ckpd)
function ckpdrds() {
  envchain aws-cookpad aws rds describe-db-instances \
    | jq '.DBInstances[].Endpoint.Address' \
    | grep $1 \
    | head -1 \
    | sed -e 's/"//g' \
    | tr -d '\r\n'
}

# get rds endpoint (bargain)
function bargainrds() {
  envchain aws-bargain aws rds describe-db-instances \
    | jq '.DBInstances[].Endpoint.Address' \
    | grep $1 \
    | head -1 \
    | sed -e 's/"//g' \
    | tr -d '\r\n'
}

function jqless() {
  cat $1 | jq '.' -C | less -R
}
