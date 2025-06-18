# set -euxo

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# ezpz_savejobenv() {
#     file=$(mktemp)
#     curl -Ls https://raw.githubusercontent.com/saforem2/ezpz/main/src/ezpz/bin/savejobenv > "${file}"
#     source "${file}" || exit
# }
#
# ezpz_getjobenv() {
#     file=$(mktemp)
#     curl -Ls https://raw.githubusercontent.com/saforem2/ezpz/main/src/ezpz/bin/getjobenv > "${file}"
#     source "${file}" || exit
# }
#

ezpz_utils() {
    # file=$(mktemp)
    # curl -Ls https://raw.githubusercontent.com/saforem2/ezpz/main/src/ezpz/bin/utils.sh > "${file}"
    # echo "Saving 'utils.sh' to ${file} and sourcing..."
    # source "${file}" || exit
    source /dev/stdin <<< $(curl -Ls 'https://raw.githubusercontent.com/saforem2/ezpz/main/src/ezpz/bin/utils.sh')
}

# trySaveJob() {
#     # ezpz_utils && ezpz_setup_job
#     ezpz_utils
#     # which ezpz_setup_job
#     ezpz_setup_job
# }
#
setup_alcf_env() {
  source <(curl -s 'https://raw.githubusercontent.com/saforem2/ezpz/refs/heads/main/src/ezpz/bin/utils.sh')
  ezpz_setup_job
}


# set_proxy_alcf() {
#     # proxy settings
#     export HTTP_PROXY="http://proxy-01.pub.alcf.anl.gov:3128"
#     export HTTPS_PROXY="http://proxy-01.pub.alcf.anl.gov:3128"
#     export http_proxy="http://proxy-01.pub.alcf.anl.gov:3128"
#     export https_proxy="http://proxy-01.pub.alcf.anl.gov:3128"
#     export ftp_proxy="http://proxy-01.pub.alcf.anl.gov:3128"
#     export no_proxy="admin,polaris-adminvm-01,localhost,*.cm.polaris.alcf.anl.gov,polaris-*,*.polaris.alcf.anl.gov,*.alcf.anl.gov"
# }

set_proxy_alcf() {
    # proxy settings
    export HTTP_PROXY="http://proxy.alcf.anl.gov:3128"
    export HTTPS_PROXY="http://proxy.alcf.anl.gov:3128"
    export http_proxy="http://proxy.alcf.anl.gov:3128"
    export https_proxy="http://proxy.alcf.anl.gov:3128"
    export ftp_proxy="http://proxy.alcf.anl.gov:3128"
}

# if [[ $(hostname) == theta* ]]; then
#     local machine="ThetaGPU"
#     export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpBNE1UST0.NQ4Oy3FSJcT4nMaMlVnYcnCtPc2mqImViSGiIxyJFrg"
if [[ $(hostname) == sophia* ]]; then
    local machine="Sophia"
    export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpNek9UYz0.IwZza04Vl83YpJWXm1tqH8tQtil74SkQtnmjGyM3h7c"
    # set_proxy_sophia
elif [[ $(hostname) == x3* || $(hostname) == polaris* ]]; then
    # export PATH="${HOME}/bin/polaris:${PATH}"
    local machine="Polaris"
    export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpBNE1UTT0.20nVrgzuPbOPdPqzhQ5-iAoFynrBpVz4SP3x7pWW2H0"
    # setup_alcf_env
    # set_proxy_alcf
elif [[ $(hostname) == x4* || $(hostname) == aurora* ]]; then
    local machine="Aurora"
    set_proxy_alcf
    export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpFM05qZz0.lABjjxtOfsGrmaUJKqFOtiJt-BZxd9AmWlshGD6xnKA"
    # setup_alcf_env
elif [[ $(hostname) == x1* || $(hostname) == uan* ]]; then
    local machine="Sunspot"
    export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpJd09URT0.7yHzS3Ccy2JelR4geEmLzu0UzHJJ_7IShND72zv-xyk"
    # # export HISTFILE="$HOME/.zsh_history-sunspot"
    # set_proxy_alcf
    # setup_alcf_env
elif [[ $(hostname) == bastion* ]]; then
    local machine="Bastion"
    export HISTFILE="$HOME/.zsh_history-sunspot"
else
    local machine=$(hostname)
    export HISTFILE="$HOME/.zsh_history"
    echo "Unknown MACHINE=${MACHINE}"
    # export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
fi

MACHINE=$(echo "${machine}" | tr '[:upper:]' '[:lower:]')
export PATH="${HOME}/bin/${MACHINE}:${PATH}"
export HISTFILE="$HOME/.zsh_history-${MACHINE}"
# export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpBNE1UST0.NQ4Oy3FSJcT4nMaMlVnYcnCtPc2mqImViSGiIxyJFrg"
export ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${MACHINE}"

# ZSH_THEME="spaceship"
# ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=(
  ~/.zfunc
  ~/.zsh/completion
  $fpath
)

# ZSH_AUTOCOMPLETE_SOURCE="~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# test -e "${ZSH_AUTOCOMPLETE_SOURCE}" && source "${ZSH_AUTOCOMPLETE_SOURCE}"

# source ~/.oh-my-zsh/oh-my-zsh.sh

# Set up the prompt
# setopt histignorealldups # sharehistory
# unsetopt sharehistory
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# te
# source $HOME/.aliases 
# test -e "${HOME}/.aliases" && source "${HOME}/.aliases"
# test -e "${HOME}/.zsh_aliases.local" && source $HOME/.zsh_aliases.local

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
# export PATH="/home/foremans/homebrew/opt/glibc/bin:$PATH"
# export PATH="/home/foremans/homebrew/opt/glibc/sbin:$PATH"
# export PATH="/home/foremans/homebrew/Homebrew/bin:$PATH"

BREW_EXEC="$HOME/.linuxbrew/Homebrew/bin/brew"
[ -f ${BREW_EXEC} ] && eval "$(${BREW_EXEC} shellenv)"
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
# BREW_EXEC="$HOME/homeebrew/bin/brew"
# [ -f ${BREW_EXEC} ] && eval "$(${BREW_EXEC} shellenv)"
# fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)


# [[ -s "/home/foremans/build/grc/grc.zsh" ]] && source /home/foremans/build/grc/grc.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# fpath+=$HOME/.zsh/pure

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# # Which plugins would you like to load?
# # Standard plugins can be found in $ZSH/plugins/
# # Custom plugins may be added to $ZSH_CUSTOM/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
# # per-directory-history
# # iterm-tab-color
# # zsh-autocomplete
# # z
# # fd
# # common-aliases
# plugins=(
#     git
#     fzf
#     # fzf-tab
#     # zsh-autosuggestions
#     # zsh-completions
#     # zsh-history-substring-search
#     colorize
#     # F-Sy-H
#     fd
#     # zsh-vi-mode
# )
# # zsh-vi-mode
#  # zsh-syntax-highlighting
# # Append a command directly
# # zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
# # zvm_after_init_commands+=('omz plugin load fzf-tab')
# export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
#
# zsh-completion zsh-completions zsh-users/zsh-completions zsh-completions-master zsh-completion-master)

# iterm-tab-color         zsh-autocomplete        zsh-autosuggestions     zsh-completions         zsh-completions-master  zsh-vi-mode
# plugins=( z zsh-completions colorize fd common-aliases)

# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# source $HOME/.oh-my-zsh/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# [ "$(hostname)==theta*" ] && alias mpielastic='mpirun -n $NGPUS -N $NGPU_PER_HOST --hostfile $COBALT_NODEFILE -x PATH -x LD_LIBRARY_PATH'
# [ "$(hostname)==x3*" || "$(hostname)==polaris*" ] && alias mpielastic='mpiexec --verbose --envall -n $NGPUS -ppn $NGPU_PER_HOST --hostfile $PBS_NODEFILE'


# export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=50000000
export HISTSIZE=5000000
export HISTORY_BASE="${HOME}/.directory_histories"
export SAVEHIST=$HISTSIZE
export HISTIGNORE="l:ls:la:ll:w:* --help:pwd:exit"
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S - "
export HISTCONTROL="ignorespace"

# TOUCHBAR settings (iam4x/zsh-iterm-touchbar)
# export TOUCHBAR_GIT_ENABLED=true
export YARN_ENABLED=true

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

setopt append_history
unsetopt correct_all
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# unsetopt SHARE_HISTORY             # DONT Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# source "${HOME}/.zgen/zgen.zsh"
# # if the init script doesn't exist
# if ! zgen saved; then
#     # specify plugins here
#     zgen oh-my-zsh

#     zgen oh-my-zsh plugins/git
#     zgen oh-my-zsh plugins/common-aliases
#     zgen oh-my-zsh plugins/colored-man-pages
#     zgen oh-my-zsh plugins/git-extras
#     # zgen oh-my-zsh plugins/python
#     zgen oh-my-zsh plugins/compleat

#     zgen load zsh-users/zsh-autosuggestions
#     zgen load zsh-users/zsh-syntax-highlighting
#     zgen load zsh-users/zsh-completions src

#     # bulk load
#     zgen loadall <<EOPLUGINS
#         mafredri/zsh-async
#         clvv/fasd
#         RobSis/zsh-completion-generator
#         chrissicool/zsh-256color
#         romkatv/powerlevel10k
# EOPLUGINS
#         # ^ can't indent this EOPLUGINS
#         #
#         # save all to init script
#     zgen save
# fi

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

# export LSCOLORS='Exfxcxdxbxegedabagacad'
# export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

eval "$( dircolors -b $HOME/LS_COLORS )"
# ######
#  z settings
[[ -s $(brew --prefix)/etc/profile.d/z.sh ]] && . $(brew --prefix)/etc/profile.d/z.sh
# . /gpfs/mira-home/foremans/.linuxbrew/etc/profile.d/z.sh


# Add some completions setting:
#
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
setopt LIST_PACKED
setopt GLOB_COMPLETE
setopt MENU_COMPLETE   # Do not autoselect the first completion entry.
setopt interactivecomments

WORDCHARS=' *?_-.[]~=&;!#$%^(){}<>/'
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified


# Miscellaneous settings
# setopt INTERACTIVE_COMMENTS  # Enable comments in interactive shell.

# Long running processes should return time after they complete. Specified
# in seconds.
# REPORTTIME=10
# TIMEFMT="%U user %S system %P cpu %*Es total"
#
ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="took: %s"

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit nvim)

#
# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# Load any custom zsh completions we've installed
if [[ -d ~/.zsh-completions && -n $(ls ~/.zsh-completions) ]]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi

# Fix bracketed paste issue
# Closes #73
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

# Load iTerm shell integrations if found.
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$PATH:$HOME/bin"

WORDCHARS=' *?_-.[]~=&;!#$%^(){}<>/'
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified


# read bash.bashrc first for some features we dont want
# to re-implement here
# source /etc/bash.bashrc
eval "$( dircolors -b $HOME/LS_COLORS )"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:*' fzf-bindings \
	'ctrl-v:execute-silent({_FTB_INIT_}code "$realpath")' \
    'ctrl-e:execute-silent({_FTB_INIT_}kwrite "$realpath")'

# remove dupes from $PATH using a zsh builtin
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path;

# Custom completion support via /etc/zsh_completion.d
fpath=( $fpath /etc/zsh_completion.d )

export ZSHEDIT="vi"

# zsh line editing
: ${ZSHEDIT:="vi"}
: ${TERM:=linux}

if [[ "$ZSHEDIT" == "vi" ]] then
    bindkey    -v
else
    bindkey    -e
    bindkey    "^[ "	magic-space
    bindkey    "^[!"	expand-history
fi


# Extended glob setting
setopt extended_glob
# disable -p '#'

##
# Completion
##
zmodload -i zsh/complist
setopt hash_list_all     # hash everything before completion
setopt completealiases   # complete alisases
setopt always_to_end     # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word  # allow completion from within a word/phrase
# setopt correct           # spelling correction for commands
setopt list_ambiguous    # complete as much of a completion until it gets ambiguous.

# Environment
# HISTSIZE=1000
# HISTFILE=${HOME}/.zsh_history
# SAVEHIST=500

# Prompt on the right side. zsh feature
#RPROMPT="[%T]"

# Set/unset  shell options
setopt   nocorrect
setopt   pushdtohome
setopt   autolist
setopt   nopromptcr
setopt   nocorrectall
setopt   autocd
setopt   recexact
setopt   longlistjobs
# setopt   histignoredups
setopt   pushdsilent
setopt   appendhistory
setopt   histexpiredupsfirst
setopt   autopushd
setopt   pushdminus
setopt   extendedglob
setopt   rcquotes
unsetopt bgnice
unsetopt autoparamslash
unsetopt hup

# Setup some basic programmable completions.  To see more examples
# of these, check out /usr/doc/packages/zsh/compctl-examples.
# You you have a slow machine, you might want to comment the lines below
# with compctl in, and comment the below two lines out.
#
# compctl -g '*(-/)' cd pushd
# compctl -g '*(/)' rmdir dircmp
# compctl -j -P % -x 's[-] p[1]' -k signals -- kill
compctl -j -P % fg bg wait jobs disown
compctl -A shift
compctl -caF type whence which
compctl -F unfunction
compctl -a unalias
# compctl -v unset typeset declare vared readonly export integer
# compctl -e disable
# compctl -d enable
#
# The default way is the usage of the zsh built-in completer
# Comment the two below lines out, if you are on a slow machine, and
# comment the above compctl lines in.

# autoload -U compinit
# compinit
# source ~/.oh-my-zsh/oh-my-zsh.sh
# ##
# # Various
# ##
# setopt auto_cd                  # if command is a path, cd into it
# setopt auto_remove_slash        # self explicit
# setopt chase_links              # resolve symlinks
# setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
# unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
# unsetopt clobber                # must use >| to truncate existing files
# unsetopt hist_beep              # no bell on error in history
# unsetopt hup                    # no hup signal at shell exit
# unsetopt ignore_eof             # do not exit on end-of-file
# unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
# setxkbmap -option compose:ralt  # compose-key
# print -Pn "\e]0; %n@%M: %~\a"   # terminal title


# Completion so "cd ..<TAB>" -> "cd ../"
# zstyle ':completion:*' special-dirs ..

# Online help
unalias  run-help 2>/dev/null || true
autoload run-help

# Don't use zsh builtin which
alias which >/dev/null && unalias which

# Common standard keypad and cursor
bindkey    "^[[2~"		yank
bindkey    "^[[3~"		delete-char

# History completion on pgup and pgdown
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[5~" history-beginning-search-backward-end
bindkey "^[[6~" history-beginning-search-forward-end


ctrl_l() {
    builtin print -rn -- $'\r\e[0J\e[H\e[22J' >"$TTY"
    builtin zle .reset-prompt
    builtin zle -R
}
zle -N ctrl_l
bindkey '^l' ctrl_l

# if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
#     bindkey    "^[2;5~"		yank
#     bindkey    "^[3;5~"		delete-char
#     bindkey    "^[5;5~"		up-history
#     bindkey    "^[6;5~"		down-history
# fi
bindkey    "^[[C"		forward-char
bindkey    "^[[D"		backward-char
bindkey    "^[[A"		up-history
bindkey    "^[[B"		down-history

# Avoid network problems
#   ... \177 (ASCII-DEL) and \010 (ASCII-BS)
#       do `backward-delete-char'
# Note: `delete-char' is maped to \033[3~
#       Therefore xterm's responce on pressing
#       key Delete or KP-Delete should be
#       \033[3~ ... NOT \177
bindkey    "^?"		backward-delete-char
bindkey    "^H"		backward-delete-char

# Home and End
# if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
#     # Normal keypad and cursor of xterm
#     bindkey    "^[[1~"	history-search-backward
#     bindkey    "^[[4~"	set-mark-command
#     bindkey    "^[[H"	beginning-of-line
#     bindkey    "^[[F"	end-of-line
#     # Home and End of application keypad and cursor of xterm
#     bindkey    "^[OH"	beginning-of-line
#     bindkey    "^[OF"	end-of-line
#     bindkey    "^[O5H"	beginning-of-line
#     bindkey    "^[O5F"	end-of-line
# else
if [[ "$TERM" == "kvt" ]] then
    bindkey    "^[[1~"	history-search-backward
    bindkey    "^[[4~"	set-mark-command
    bindkey    "^[OH"	beginning-of-line
    bindkey    "^[OF"	end-of-line
else
    # TERM=linux or console
    bindkey    "^[[1~"	beginning-of-line
    bindkey    "^[[4~"	end-of-line
fi
# fi

# Application keypad and cursor of xterm
# if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
#     bindkey    "^[OD"	backward-char
#     bindkey    "^[OC"	forward-char
#     bindkey    "^[OA"	up-history
#     bindkey    "^[OB"	down-history
#     # DEC keyboard KP_F1 - KP_F4
#     bindkey -s "^[OP"	"^["
#     bindkey    "^[OQ"	undo
#     bindkey    "^[OR"	undefined-key
#     bindkey    "^[OS"	kill-line
# fi
if [[ "$TERM" == "gnome" ]] then
    # or gnome terminal F1 - F4
    bindkey -s "^[OP"	"^["
    bindkey    "^[OQ"	undo
    bindkey    "^[OR"	undefined-key
    bindkey    "^[OS"	kill-line
fi
# Function keys F1 - F12
if [[ "$TERM" == "linux" ]] then
    # On console the first five function keys
    bindkey    "^[[[A"	undefined-key
    bindkey    "^[[[B"	undefined-key
    bindkey    "^[[[C"	undefined-key
    bindkey    "^[[[D"	undefined-key
    bindkey    "^[[[E"	undefined-key
else
    # The first five standard function keys
    bindkey    "^[[11~"	undefined-key
    bindkey    "^[[12~"	undefined-key
    bindkey    "^[[13~"	undefined-key
    bindkey    "^[[14~"	undefined-key
    bindkey    "^[[15~"	undefined-key
fi
bindkey    "^[[17~"		undefined-key
bindkey    "^[[18~"		undefined-key
bindkey    "^[[19~"		undefined-key
bindkey    "^[[20~"		undefined-key
bindkey    "^[[21~"		undefined-key
# Note: F11, F12 are identical with Shift_F1 and Shift_F2
bindkey    "^[[23~"		undefined-key
bindkey    "^[[24~"		undefined-key

# Shift Function keys F1  - F12
#      identical with F11 - F22
#
# bindkey   "^[[23~"	undefined-key
# bindkey   "^[[24~"	undefined-key
bindkey    "^[[25~"		undefined-key
bindkey    "^[[26~"		undefined-key
# DEC keyboard: F15=^[[28~ is Help
bindkey    "^[[28~"		undefined-key
# DEC keyboard: F16=^[[29~ is Menu
bindkey    "^[[29~"		undefined-key
bindkey    "^[[31~"		undefined-key
bindkey    "^[[32~"		undefined-key
bindkey    "^[[33~"		undefined-key
bindkey    "^[[34~"		undefined-key
# if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
#     # Not common
#     bindkey    "^[[35~"	undefined-key
#     bindkey    "^[[36~"	undefined-key
# fi

# if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
#     # Application keypad and cursor of xterm
#     # with NumLock ON
#     #
#     # Operators
#     bindkey -s "^[Oo"	"/"
#     bindkey -s "^[Oj"	"*"
#     bindkey -s "^[Om"	"-"
#     bindkey -s "^[Ok"	"+"
#     bindkey -s "^[Ol"	","
#     bindkey -s "^[OM"	"\n"
#     bindkey -s "^[On"	"."
#     # Numbers
#     bindkey -s "^[Op"	"0"
#     bindkey -s "^[Oq"	"1"
#     bindkey -s "^[Or"	"2"
#     bindkey -s "^[Os"	"3"
#     bindkey -s "^[Ot"	"4"
#     bindkey -s "^[Ou"	"5"
#     bindkey -s "^[Ov"	"6"
#     bindkey -s "^[Ow"	"7"
#     bindkey -s "^[Ox"	"8"
#     bindkey -s "^[Oy"	"9"
# fi

#  EMACS line editing
if [[ "$ZSHEDIT" == "emacs" ]] then
    # ... xterm application cursor
#     if [[ "$TERM" == "xterm" || "$TERM" == "xterm-256color" ]] then
# 	bindkey    "^[^[OD"	backward-word
# 	bindkey    "^[^[OC"	forward-word
# 	bindkey    "^[^[OA"	up-history
# 	bindkey    "^[^[OB"	down-history
# 	bindkey    "^^[OD"	backward-char
# 	bindkey    "^^[OC"	forward-char
# 	bindkey    "^^[OA"	up-history
# 	bindkey    "^^[OB"	down-history
#     fi
    # Standard cursor
    bindkey    "^[^[[D"	backward-word
    bindkey    "^[^[[C"	forward-word
    bindkey    "^[^[[A"	up-history
    bindkey    "^[^[[B"	down-history
    bindkey    "^^[[D"	backward-char
    bindkey    "^^[[C"	forward-char
    bindkey    "^^[[A"	up-history
    bindkey    "^^[[B"	down-history
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# [[ ! -f ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# alias ls="lsd -X -A --icon-theme=fancy --group-dirs=first -I '__pycache__' -I '*.DS_Store' -I '*.virtual_documents'"
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# fnm
# export PATH=/home/foremans/.fnm:$PATH
# eval "`fnm env`"
fpath=($fpath "/home/foremans/.zfunctions")
#eval "$(fnm env --use-on-cd)"
#
#
eval "$(fnm env)"

eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim


# Set typewritten ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt typewritten
# export TYPEWRITTEN_PROMPT_LAYOUT="half_pure"
#

# Load existing bash shell completion
#
# ZSYNHI="$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# [ -f "${ZSYNHI}" ] && source "${ZSYNHI}" || echo "No ${ZSYNHI}"
# source /home/foremans/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use modern completion system
# autoload -Uz compinit
# compinit

# autoload -Uz bashcompinit && bashcompinit
# The following lines were added by compinstall

# zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
# zstyle ':completion:*' max-errors 2
# zstyle ':completion:*' verbose true
# zstyle :compinstall filename '/home/foremans/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
#
# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

#
# # all Tab widgets
# zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
# # all history widgets
# zstyle ':autocomplete:*history*:*' insert-unambiguous yes
#
# # ^S
# zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
#
#
# Set the value for all.
# zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'

#
# () {
#    local -a prefix=( '\e'{\[,O} )
#    local -a up=( ${^prefix}A ) down=( ${^prefix}B )
#    local key=
#    for key in $up[@]; do
#       bindkey "$key" up-line-or-history
#    done
#    for key in $down[@]; do
#       bindkey "$key" down-line-or-history
#    done
#    zle -A {.,}history-incremental-search-backward
#    zle -A {.,}vi-history-search-backward
#    bindkey -M emacs '^S' history-incremental-search-forward
#    bindkey -M vicmd '/' vi-history-search-forward
# }
# #
# () {
#    local -a prefix=( '\e'{\[,O} )
#    local -a up=( ${^prefix}A ) down=( ${^prefix}B )
#    local key=
#    for key in $up[@]; do
#       bindkey "$key" up-line-or-history
#    done
#    for key in $down[@]; do
#       bindkey "$key" down-line-or-history
#    done
# }

# alias ls="exa -x --icons --group-directories-first -F"
test -e "${HOME}/.zsh_aliases" && source "${HOME}/.zsh_aliases"
test -e "${HOME}/.zshrc.d/aliases" && source "${HOME}/.zshrc.d/aliases"
test -e "${HOME}/.zshrc.d/completion.zsh" && source "${HOME}/.zshrc.d/completion.zsh"
test -e "${HOME}/.zshrc.d/styles.zsh" && source "${HOME}/.zshrc.d/styles.zsh"
test -e "${HOME}/.zshrc.d/scripts.zsh" && source "${HOME}/.zshrc.d/scripts.zsh"

test -e "${HOME}/.config/zsh/styles.zsh" && source "${HOME}/.config/zsh/styles.zsh"
test -e "${HOME}/.config/zsh/keybinds.zsh" && source "${HOME}/.config/zsh/keybinds.zsh"
test -e "${HOME}/.config/zsh/extras.zsh" && source "${HOME}/.config/zsh/extras.zsh"
test -e "${HOME}/.config/zsh/functions.zsh" && source "${HOME}/.config/zsh/functions.zsh"

eval "$(zoxide init zsh)"

# [ "$(hostname)==theta*" ] && alias mpielastic='mpirun -n $NGPUS -N $NGPU_PER_HOST --hostfile $COBALT_NODEFILE -x PATH -x LD_LIBRARY_PATH'
# [ "$(hostname)==x3*" || "$(hostname)==polaris*" ] && alias mpielastic='mpiexec --verbose --envall -n $NGPUS -ppn $NGPU_PER_HOST --hostfile $PBS_NODEFILE'

unsetopt correct_all
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  # export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
  export PATH="${PATH}:${HOME}/.luarocks/bin"
}

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

if [[ -f ~/.zshrc.d/functions/fzf_functions.sh ]]; then
    source ~/.zshrc.d/functions/fzf_functions.sh
fi

# vim: ts=4:sw=4:softtabstop=4:expandtab:autoindent

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# eval "$(atuin init zsh)"
#
eval "$(starship init zsh)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/foremans/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/lus/flare/projects/Aurora_deployment/foremans/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

. "$HOME/.cargo/env"
# autoload -Uz compinit && compinit
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice from"gitlab"
zinit load "code-stats/code-stats-zsh"
# zinit light "code-stats/code-stats-zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zsh-users/zsh-syntax-highlighting
zinit light-mode for \
    popstas/zsh-command-time \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search \
    z-shell/F-Sy-H \
    jeffreytse/zsh-vi-mode \
    Aloxaf/fzf-tab \
    joshskidmore/zsh-fzf-history-search

### End of Zinit's installer chunk
# zvm_after_init_commands+=('source <(fzf --zsh)')
zvm_after_init_commands+=("eval $(fzf --zsh | sed -e '/zmodload/s/perl/perl_off/' -e '/selected/s/fc -rl/fc -rlt \"%Y-%m-%d %H:%M\"/')")
zvm_after_init_commands+=("setopt interactivecomments")
# # zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
# # zvm_after_init_commands+=('omz plugin load fzf-tab')
export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
# zvm_after_init_commands+=('zinit light Aloxaf/fzf-tab')
### End of Zinit's installer chunk
#
unsetopt INTERACTIVE_COMMENTS
unsetopt BAD_PATTERN

[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
export PATH=/home/foremans/.pixi/bin:$PATH
eval "$(pixi completion --shell zsh)"

. "$HOME/.atuin/bin/env"
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - zsh)"             ##basher5ea843
