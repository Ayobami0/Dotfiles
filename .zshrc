# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"

# tmux
export ZSH_TMUX_DEFAULT_SESSION_NAME=$USER
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTONAME_SESSION=true
export ZSH_TMUX_AUTOQUIT=false


zstyle ':omz:update' mode disabled  # disable automatic updates

# ZSH_THEME="miloshadzic"
# ZSH_THEME="random"
# ZSH_THEME="minimal"
ZSH_THEME="nicoulaj"
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

eval $(thefuck --alias)

alias fk=fuck
alias rc="ranger ~/.config"

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


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
#
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
tls() {
  session="$(tmux ls | fzf |  cut -d ':' -f 1)"

  if [[ "$session" != "" ]]; then
    tmux attach-session -t "$session"
  fi
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/Ayobami/google-cloud-sdk/path.zsh.inc' ]; then . '/home/Ayobami/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/Ayobami/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/Ayobami/google-cloud-sdk/completion.zsh.inc'; fi
