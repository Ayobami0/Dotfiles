export ZSH="$HOME/.oh-my-zsh"
# tmux
export ZSH_TMUX_DEFAULT_SESSION_NAME=$USER
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTONAME_SESSION=true
export ZSH_TMUX_AUTOQUIT=false

export FZF_DEFAULT_OPTS_FILE=~/.fzfrc


zstyle ':omz:update' mode disabled  # disable automatic updates

ZSH_THEME="miloshadzic"
# ZSH_THEME="random"
# ZSH_THEME="minimal"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="sorin"
ENABLE_CORRECTION="false"

plugins=(
  # archlinux
  git
  zsh-autosuggestions
  thefuck
  tmux
  #zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

set -o vi

eval $(thefuck --alias)

alias fk=fuck
alias rc="ranger ~/.config"
alias emacs="emacs -nw"

export VISUAL='nvim'
export EDITOR='nvim'
export TERMINAL='alacritty'
export PATH="$( echo $PATH| tr : '\n' |grep -v /home/Ayobami/.config/emacs/bin | paste -s -d: )"
export PATH="$PATH:$HOME/.emacs.d/bin/"
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:/home/Ayobami/.local/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=$PATH:/usr/bin/flutter/bin
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH="$PATH:$(go env GOPATH)/bin"
# export PATH='/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/flutter/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl'

# attach to an existing session
tls() {
  session="$(tmux ls | fzf |  cut -d ':' -f 1)"

  if [[ "$session" != "" ]]
    then
	    if [[ "$TERM" = "tmux-256color" ]]
	    then
		    tmux switchc -t "$session"
	    else
		    tmux attach-session -t "$session"
	fi
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# eval "$(pyenv virtualenv-init -)"



# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/Ayobami/google-cloud-sdk/path.zsh.inc' ]; then . '/home/Ayobami/google-cloud-sdk/path.zsh.inc'; fi
#
# # The next line enables shell command completion for gcloud.
# if [ -f '/home/Ayobami/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/Ayobami/google-cloud-sdk/completion.zsh.inc'; fi


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

