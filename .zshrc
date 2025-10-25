#!/bin/zsh


if [[ -f "$HOME/.zshrc.local" ]]; then
  echo "Sourcing ${HOME}/.zshrc.local"
  source "${HOME}/.zshrc.local"
fi
