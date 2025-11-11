
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
##################################
#   zstyle completion options    #
#################################
# autoload -U compinit && compinit
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    # autoload -Uz compinit
    # compinit
    if [[ "${TERM}" == xterm-kitty ]] ; then
      kitty + complete setup zsh | source /dev/stdin
    fi
fi
#
# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(gdircolors -b)"
eval "$( gdircolors -b $HOME/LS_COLORS )"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Load any custom zsh completions we've installed
if [ -d ~/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi


if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  # autoload -U promptinit ; promptinit
  # autoload -Uz compinit
  # compinit
fi

# Don't show completion for current word, if it consists of two or more dots
zstyle ':autocomplete:*' ignored-input '..##'
zstyle ':autocomplete:*' widget-style complete-word 

