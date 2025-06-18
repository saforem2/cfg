# User configuration
#
# +------------+
# | NAVIGATION |
# +------------+
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# setopt AUTO_PUSHD
# setopt PUSHD_IGNORE_DUPS
# setopt PUSHD_SILENT
# setopt CORRECT
# setopt CDABLE_VARS
# setopt EXTENDED_GLOB
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt SHARE_HISTORY

# set some options about directories
setopt pushd_ignore_dups
#setopt pushd_silent
setopt AUTO_CD  # If a command is issued that can’t be executed as a normal command,
                # and the command is the name of a directory, perform the cd command
                # to that directory.

# set some history options

# Share your history across all your terminal windows
#setopt noclobber


# Add some completions settings
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
unsetopt MENU_COMPLETE   # Do not autoselect the first completion entry.

# Miscellaneous settings
setopt INTERACTIVE_COMMENTS  # Enable comments in interactive shell.

# Extended glob setting
setopt extended_glob

##
# Completion
##
zmodload -i zsh/complist
setopt hash_list_all     # hash everything before completion
setopt completealiases   # complete alisases
setopt always_to_end     # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word  # allow completion from within a word/phrase
setopt correct           # spelling correction for commands
setopt list_ambiguous    # complete as much of a completion until it gets ambiguous.
#
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
# export LSCOLORS='Exfxcxdxbxegedabagacad'
# export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
# export LSCOLORS='Exfxcxdxbxegedabagacad'
