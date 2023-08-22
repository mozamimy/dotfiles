###########################
# Configurations for PATH #
###########################

if [ `uname` = "Darwin" ]; then
  # Homebrew and coreutils
  export PATH="${HOME}/bin:/opt/brew/bin:/opt/brew/sbin:/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/brew/opt/go/libexec/bin":$PATH
  export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman":$MANPATH
fi

if [ `uname` = "Linux" ]; then
  export PATH="/home/$USER/bin":$PATH
fi

# Rust
export PATH=$HOME/.cargo/bin:$PATH
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src # For rust-racer/vim-racer
. "$HOME/.cargo/env"

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

# nvim
export EDITOR="nvim"
export VISUAL="nvim"
alias vim='nvim'

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
alias cdg='cd "$(git rev-parse --show-toplevel)"'

# file and directory
alias l="ls"
alias la="ls -a"
alias ll="ls -al"
alias rmr="rm -r"
alias rmrf="rm -rf"

# etc
alias nomad53="envchain aws-personal-admin nomad53 en7 ZB3J3CGDM0KPR me.mozami.me"
alias sb2md="npx @hogashi/sb2md@latest"

# cookpad
alias launch_proxy="ssh -fN awsproxy.vpc"
alias kill_proxy="pkill -f 'ssh -fN awsproxy.vpc'"
alias spec_setup="bundle exec rake cookpad:spec:setup[4]"

# AWS
export AWS_REGION=ap-northeast-1
export AWS_DEFAULT_REGION=ap-northeast-1
export AWSSH_CSSH=tmux-nested-cssh
alias ec="envchain aws-cookpad"
alias ecbe="envchain aws-cookpad bundle exec"
alias ed="envchain aws-cookpad-dev"
alias edbe="envchain aws-cookpad-dev bundle exec"
alias ep="envchain aws-personal-admin"
alias epbe="envchain aws-personal-admin bundle exec"
alias el="envchain aws-cookpad-hako-lambda"
alias elbe="envchain aws-cookpad-hako-lambda bundle exec"

# tig with colors
alias tig='TERM=xterm-256color tig'

#############
# Utilities #
#############

# Post to Slack
alias toot="envchain ckpd-slack-webhook toot"
alias toot-infra="envchain ckpd-slack-webhook toot \"#infra\""
alias toot-mozamimy-memo="envchain ckpd-slack-webhook toot \"#mozamimy-memo\""

# make a directory and move into it
function z_mkdirr() {
  local aliased_current_dir=$(pwd)
  local current_dir=$(pwd -P)
  local slash=/

  cd $current_dir
  mkdir $1

  cd $aliased_current_dir$slash$1
}

# notify on OS X
function z_notify() {
  osascript -e "display notification \"$1\""

  if [ -n "$TMUX" ]; then
    reattach-to-user-namespace say $1
  else
    say $1
  fi
}

function z_jqless() {
  cat $1 | jq '.' -C | less -R
}

function z_ssh-add-all() {
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_rsa.internal
  ssh-add ~/.ssh/id_rsa.private
  ssh-add ~/.ssh/cookpad2_aws.pem
  ssh-add ~/.ssh/id_rsa.infra
  ssh-add ~/.ssh/id_ed25519.infra-2204
  # ssh-add ~/.ssh/id_rsa.cookpad.dev
  # ssh-add ~/.ssh/id_rsa.summer-intern.pem
}

function z_mugen-loop() {
  while true
  do
    $1
    sleep $2
  done
}

function z_quick_furik() {
  since=${1:-0}
  furik activity -l -d $since | ruby -e 'print STDIN.read.gsub("@", "[at]").gsub(/^###/, "##")' | sed '1,3d'
}

function z_quickrenice() {
  ps aux | grep "$1" | grep -v "grep" | awk '{print $2}' | xargs sudo renice $2
}

#####################
# Utilities for AWS #
#####################

# get rds endpoint
function rdslist() {
  aws rds describe-db-instances \
    | jq '.DBInstances[].Endpoint.Address' \
    | grep $1 \
    | head -1 \
    | sed -e 's/"//g' \
    | tr -d '\r\n'
}

function continue-lifecycle-hook() {
  ec aws autoscaling complete-lifecycle-action --lifecycle-hook-name $1 --auto-scaling-group-name $2 --lifecycle-action-token $3 --lifecycle-action-result CONTINUE
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yuma-asada/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
