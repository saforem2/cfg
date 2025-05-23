# XXX: uncomment to enable startup profiling
# zmodload zsh/zprof

DISABLE_MAGIC_FUNCTIONS="true"
# export ZDOTDIR="$HOME/.zshrc.d"
# export ZDOTDIR="$HOME/.config/zshell"
# export ZDOTDIR="$HOME/.zsh/"

# ZSH_AUTOCOMPLETE_SOURCE="~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# test -e "${ZSH_AUTOCOMPLETE_SOURCE}" && source "${ZSH_AUTOCOMPLETE_SOURCE}"
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# export ZDOTDIR="$HOME/.config/zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# % git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

# test -e "~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" && source ~/.oh-my-zsh/custom/plugins/
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# fpath+=$ZSH/plugins/conda-zsh-completion

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="starship"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#

# Long running processes should return time after they complete. Specified
# in seconds.
# REPORTTIME=2
# TIMEFMT="%U user %S system %P cpu %*Es total"
# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpBNE1URT0.7U53-cf_seuvKtDXCV2xPDxUyD3bzHQh_hEAbJTAaEk"
export COMPLETION_WAITING_DOTS="true"
export AUTOJUMP_IGNORE_CASE=1
export EDITOR="nvim"
export GOPATH=$HOME/gocode
export TYPEWRITTEN_CURSOR="beam"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
# Keep a ton of history. You can reset these without editing .zshrc by
# adding a file to ~/.zshrc.d.
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=50000000
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
export HISTIGNORE="l:ls:la:ll:cd:w:* --help:pwd:exit"
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S - "
export HISTCONTROL="ignorespace"
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   # git
#   # zsh-autosuggestions
#   # iterm-tab-color
#   # conda-zsh-completion
#   # zsh-syntax-highlighting
#   # z
#   # colorize
#   # pyenv
#   # pylint
#   # python
#   # F-Sy-H
# )
#
# source $ZSH/oh-my-zsh.sh
#

function iplot {
    cat <<EOF | gnuplot
    set terminal pngcairo enhanced font 'IBM Plex Mono,12'
    set autoscale
    set samples 1000
    set output '|kitten icat --stdin yes'
    set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#1c1c1c" behind
    plot $@
    set output '/dev/null'
EOF
}


test -e "${HOME}/.config/zsh/styles.zsh" && source "${HOME}/.config/zsh/styles.zsh"
test -e "${HOME}/.config/zsh/keybinds.zsh" && source "${HOME}/.config/zsh/keybinds.zsh"
test -e "${HOME}/.config/zsh/extras.zsh" && source "${HOME}/.config/zsh/extras.zsh"
test -e "${HOME}/.config/zsh/functions.zsh" && source "${HOME}/.config/zsh/functions.zsh"
test -e "${HOME}/.config/nvim-Lazyman/.lazymanrc" && source "${HOME}/.config/nvim-Lazyman/.lazymanrc"


# remove dupes from $PATH using a zsh builtin
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

WORDCHARS=' *?_-.[]~=&;!#$%^(){}<>/'
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified

autoload -U promptinit ; promptinit
zmodload zsh/nearcolor

# source $HOME/.aliases
test -e "${HOME}/.zsh_aliases" && source "${HOME}/.zsh_aliases"
test -e "${HOME}/.zshrc.d/aliases" && source "${HOME}/.zshrc.d/aliases"

# test -e "source ~/.oh-my-zsh/custom/plugins/code-stats-zsh/codestats.plugin.zsh"
test -e "source ~/.zshrc.d/completion.zsh"
# test -e "source ~/.zshrc.d/fzf.zsh"
test -e "source ~/.zshrc.d/scripts.zsh"
test -e "source ~/.zshrc.d/scripts_fzf.zsh"
test -e "source ~/.zshrc.d/plugins/zsh-syntax-highlighting"
# Change cursor
# source "/plugins/cursor_mode"
test -e "source ~/.zshrc.d/plugins/cursor_mode"

# ~/.zshrc.d/plugins/zsh-syntax-highlighting/

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# export LS_COLORS=$(vivid generate snazzy)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'
# test -e "source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export PATH=$PATH:/Users/samforeman/.spicetify

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/Users/samforeman/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/Users/samforeman/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/Users/samforeman/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/Users/samforeman/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/Users/samforeman/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
export MODULAR_HOME="/Users/samforeman/.modular"
export PATH="/Users/samforeman/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

vv() {
  # Assumes all configs exist in directories named ~/.config/nvim-*
  local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return
  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim
}
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
# Bob neovim version manager path
[ -d ${HOME}/.local/share/bob/nvim-bin ] && {
  export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"
}
# Go paths
[ -d ~/go ] && export GOPATH=$HOME/go
[ "$GOPATH" ] && [ -d "$GOPATH/bin" ] && PATH="$PATH:$GOPATH/bin"

if [ -d /opt/homebrew/opt/go/libexec ]
then
  export GOROOT=/opt/homebrew/opt/go/libexec
else
  if [ -d /opt/homebrew/opt/go ]
  then
    export GOROOT=/opt/homebrew/opt/go
  else
    [ -d /usr/local/go ] && export GOROOT=/usr/local/go
  fi
fi
[ -d ${GOROOT}/bin ] && {
  if [ $(echo $PATH | grep -c ${GOROOT}/bin) -ne "1" ]; then
    PATH="$PATH:${GOROOT}/bin"
  fi
}
[ -d $HOME/go/bin ] && {
  if [ $(echo $PATH | grep -c $HOME/go/bin) -ne "1" ]; then
    PATH="$PATH:$HOME/go/bin"
  fi
}
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

# bun completions
# [ -s "/Users/samforeman/.oh-my-zsh/completions/_bun" ] && source "/Users/samforeman/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export FPATH="<path_to_eza>/completions/zsh:$FPATH"

source /Users/samforeman/.config/broot/launcher/bash/br
export FPATH="~/projects/eza-community/eza/completions/zsh:$FPATH"

fpath=(
  ~/.zfunc
  ~/.zsh/completion/
  $fpath
)

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}


eval "$(starship init zsh)"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu yes select
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l'


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "${HOME}/.fzfrc"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# bindkey '^I' fzf_completion

# if [[ command -v "enablew-fzf-tab" ]]; then
#     echo "Enabling fzf-tab"
#     enable-fzf-tab
# fi
# enable-fzf-tab
#
# fzf_tab_completion="${HOME}/projects/fzf-tab-completion/zsh/fzf-zsh-completion.sh"
# [ -f "${fzf_tab_completion}" ] && source "${fzf_tab_completion}"

# # zsh-fzf-history-search
# zinit ice lucid wait'0'
# zinit light joshskidmore/zsh-fzf-history-search
zinit ice from"gitlab"
zinit load "code-stats/code-stats-zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    popstas/zsh-command-time \
    Aloxaf/fzf-tab \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search \
    z-shell/F-Sy-H \
    jeffreytse/zsh-vi-mode \
    joshskidmore/zsh-fzf-history-search

### End of Zinit's installer chunk
# zvm_after_init_commands+=('source <(fzf --zsh)')
# zvm_after_init_commands+=(eval \"$(fzf --zsh | sed -e '/zmodload/s/perl/perl_off/' -e '/selected/s/fc -rl/fc -rlt \"%Y-%m-%d %H:%M\"/'))
zvm_after_init_commands+=("eval $(fzf --zsh | sed -e '/zmodload/s/perl/perl_off/' -e '/selected/s/fc -rl/fc -rlt \"%Y-%m-%d %H:%M\"/')")

# bindkey '^r' fzf_history_search

### End of Zinit's installer chunk
#
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
unset KEYTIMEOUT  # fix oh-my-zsh breaking keybinds
[ -f ~/.fzf.git.sh ] && source ~/.fzf.git.sh
# scroll-and-clear-screen() {
#   printf '\n%.0s' {1..$LINES}
#   zle clear-screen
# }
# zle -n scroll-and-clear-screen
# bindkey '^l' scroll-and-clear-screen

# if [ $(command -v "fzf") ]; then
#   test -e "source ~/.zshrc.d/fzf.zsh"
# fi


[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
source ~/.mmhook.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/samforeman/.cache/lm-studio/bin"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit bashcompinit
if [[ "$(find ~/.zcompdump -mtime 1)" ]]; then
  compinit
fi
compinit -C
bashcompinit

compinit
pokeget random

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^s' atuin-search

# export MCFLY_KEY_SCHEME=vim
# export MCFLY_FUZZY=2
eval "$(mcfly init zsh)"
eval "$(mcfly-fzf init zsh)"


### Bashhub.com Installation
if [ -f ~/.bashhub/bashhub.zsh ]; then
    source ~/.bashhub/bashhub.zsh
fi


# XXX: uncomment to enable startup profiling
# zprof
