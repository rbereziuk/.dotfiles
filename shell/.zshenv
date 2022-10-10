# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH";

# set vim default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# FZF
# Setting fd as the default source for fzf
#export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}' --height 100%"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export MANPAGER="vim -M +MANPAGER -"
export MANPAGER="nvim +Man!"
export KNOWLEDGE_BASE_DIR=/home/roman/Documents/Knowledge-base/
