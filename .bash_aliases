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

export EDITOR=vim

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
alias lbrynet='/opt/LBRY/resources/static/daemon/lbrynet'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'


# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Autocomplet with dots
_comp_options+=(globdots)

#Personal additions
alias virc='vi ~/.bash_aliases'
alias zrc='vi ~/.zshrc'
alias src='source ~/.zshrc'

alias abrew="/opt/homebrew/bin/brew"
alias i="arch -x86_64"
alias ibrew="arch -x86_64  /usr/local/bin/brew"
alias irvm="arch -x86_64 rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

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

. /opt/homebrew/opt/asdf/asdf.sh
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

alias brails='bundle exec rails'
alias update='brew update && brew upgrade'
alias dps='docker ps'
alias py='python3'
