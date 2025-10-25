# Setup fzf
# ---------
if [[ ! "$PATH" == */home/foremans/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/foremans/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/foremans/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/foremans/.fzf/shell/key-bindings.zsh"
