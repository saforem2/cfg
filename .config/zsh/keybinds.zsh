# edit current command line with vim (vim-mode, then CTRL-v)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line

# +-----------+
# | VI KEYMAP |
# +-----------+

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor
# source "/plugins/cursor_mode"
test -e "source ~/.zshrc.d/plugins/cursor_mode"

# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
# Emulation of vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# scroll-and-clear-screen() {
#   printf '\n%.0s' {1..$LINES}
#   zle clear-screen
# }
# zle -N scroll-and-clear-screen
# bindkey '^l' scroll-and-clear-screen
#
ctrl_l() {
    builtin print -rn -- $'\r\e[0J\e[H\e[22J' >"$TTY"
    builtin zle .reset-prompt
    builtin zle -R
}
zle -N ctrl_l
bindkey '^l' ctrl_l



# Make Tab and ShiftTab cycle completions on the command line
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# Make Tab go straight to the menu and cycle there
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
#
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
   zle -A {.,}history-incremental-search-backward
   zle -A {.,}vi-history-search-backward
   bindkey -M emacs '^S' history-incremental-search-forward
   bindkey -M vicmd '/' vi-history-search-forward
}

bindkey -M viins '^f' autosuggest-accept

bindkey -M viins '^r' fzf-history-widget
bindkey -M vicmd '^r' fzf-history-widget
