#!/bin/zsh

[ -f ~/.zsh/startup ] && source ~/.zsh/startup

# [ -f ~/miniconda3bin/conda ] && eval "$(${HOME}/miniconda3/bin/conda shell.zsh hook)"
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
