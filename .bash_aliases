#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR=nvim

alias pacman-update='sudo pacman-mirrors --geoip'

alias ls='ls'
alias ll='ls -l'
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias z='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'
alias vim='nvim'
alias vi='nvim'
alias gds-start='sudo systemctl start openvpn-client@gds'
alias gds-stop='sudo systemctl stop openvpn-client@gds'
gitupdate() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github
    ssh -T git@github.com
}
alias gp='git pull'
alias gu='git update'
alias gpu='git push'
alias gcob='gco -b'
alias lbrynet='/opt/LBRY/resources/static/daemon/lbrynet'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'


# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Autocomplet with dots
_comp_options+=(globdots)

#Personal additions
alias virc='vi ~/.bash_aliases'
alias zshrc='vi ~/.zshrc'
alias src='source ~/.zshrc'

alias abrew="/opt/homebrew/bin/brew"
alias i="arch -x86_64"
alias ibrew="arch -x86_64  /usr/local/bin/brew"
alias irvm="arch -x86_64 rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add NPM to PATH
export PATH="$PATH:$HOME/.asdf/installs/nodejs/16.4.1/.npm/bin"

_ARCH=$(arch)
PROMPT="$_ARCH $PROMPT"

# Requires iterm2
if [[ "$_ARCH" == "i386" ]]; then
  echo -ne "\033]1337;SetColors=bg=000FC5\007"
  #usr/local is X_86
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/opt:$PATH"
fi

if [[ "$_ARCH" == "arm64" ]]; then
  echo -ne "\033]1337;SetColors=bg=1e1d40\007"
  #usr/local is X_86
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt:$PATH"
fi
alias color='echo -ne "\033]1337;SetColors=bg=1e1d40\007"'

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/dinushkaherath/Developer/flutter/bin"

#Missing zstd and openssl when installing gem
#bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix zstd):$(brew --prefix openssl)" this works first
#first ^^^
#gem install mysql2 -- --with-opt-dir="$(brew --prefix zstd):$(brew --prefix openssl)"

#Ruby version not from asdf
# add /Users/dinushkaherath/.asdf/shims/ to /etc/paths top

#nodejs install arch -x86_64 asdf install nodejs 12.9.0

#

#Add Flutter to path
export PATH="$PATH:$HOME/Developer/flutter/bin"

#Add Dart packages to path
export PATH="$PATH":"$HOME/.pub-cache/bin"

alias update='brew update && brew upgrade'
alias dps='docker ps -a'
alias dka='docker container kill $(docker ps -q) > /dev/null 2>&1; docker container rm $(docker ps -a -q) > /dev/null 2>&1; echo "docker containers killed and removed"'
alias dsa='docker container kill $(docker ps -q) > /dev/null 2>&1; echo "docker containers killed"'
alias py='python3'
alias tm='~/bin/./load_tmux.sh'
alias gmc='g merge --continue'
alias gma='g merge --abort'
alias gmm='g merge ${MASTER:-master}'
alias grc='g rebase --continue'
alias gra='g rebase --abort'
alias grm='g rebase ${MASTER:-master}'
alias gcp='g cherry-pick'
alias gcc='g cherry-pick --continue'
alias gca='g cherry-pick --abort'
alias gcs='g cherry-pick --skip'
alias gcom='gco ${MASTER:-master}; gp'
alias gls='g remote update --prune; gbr | grep master; gb | cat'
alias gcls='gcom; g branch --no-contains ${MASTER:-master} --merged ${MASTER:-master} | xargs git branch -d; gls'
alias go="g remote -v | grep 'origin.*push' | sed 's/.*://g' | sed 's/\.git.*//g' | (echo -n 'http://www.github.com/' && cat) | xargs open"
alias gpub='g push --set-upstream origin $(git branch --show-current)'
gpuh() {
    if [ -z "$1" ]
    then
	branch=$(git branch --show-current)
	git push staging $branch:master --force
    else
	git push staging "${MASTER:-master}":master -force
    fi
}
gri() {
    if [ -z "$1" ]
    then
	echo "Pass in the number of commits to rebase"
    else
	git rebase -i HEAD~"$1"
    fi
}

get_rs_name() {
    basename $(git remote show -n origin | grep Push | cut -d: -f2-)
}

check_rs_name () {
    rs_name=$(get_rs_name)
    if [ -z "$rs_name" ]; then
	echo "you have to set up git remote"
	return 1
    fi
    if ! cat /etc/hosts | grep -q "127.0.0.1 $rs_name"; then
	echo "copy and run the following line"
	echo "sudo -- sh -c \"echo '127.0.0.1 $rs_name' >> /etc/hosts\""
	return 1
    fi
}

alias rs='spring stop; check_rs_name && rails s -b $(get_rs_name) -p 3001'
alias rr='spring stop; rails restart'
alias rc='spring stop; rails c'
alias rdbd='spring stop; rails db:drop RAILS_ENV=development'
alias rdbc='rails db:create RAILS_ENV=development'
alias rdbm='rails db:migrate RAILS_ENV=development'
alias rdbdt='spring stop; rails db:drop RAILS_ENV=test'
alias rdbct='rails db:create RAILS_ENV=test'
alias rdbmt='rails db:migrate RAILS_ENV=test'
alias rdbr='rdbd; rdbc; rdbm'
alias rdbrt='rdbdt; rdbct; rdbmt'
alias rdbs="rails db:seed"
alias rdbrb="rails db:rollback"
alias rspec='spring stop; rspec'

# I forget where vim configs are... here they are!
alias vivim='vi ~/.config/nvim/init.vim'
export CSS='/Users/dinushkaherath/Developer/github/css_themes/'

# add GPG keys stuff verified commits
export GPG_TTY=$(tty)

# docker execute
first_doc=$(echo "$(dps -a --format '{{.Names}}' )" | head -n 1)
alias dx='docker exec -it ${DOCKER_EXEC:-$first_doc}'
dxx() {
  docker exec -it $( docker ps | grep $1 | awk "{print \$1}" | head -n 1 ) "${@:2}"
}
alias dxs='dx bin/startup.sh'
alias dxb='dx bash'
alias dxc='dx rails c'

for dir in /opt/homebrew/Cellar/asdf/*; do
  [[ -d $dir ]] || continue
  export ASDF_DIR=$dir/libexec
done
