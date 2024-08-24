# Setup fzf
# ---------
if [[ ! "$PATH" == */home/patrick/Downloads/fzf/bin* && "$OSTYPE" == "linux-gnu"* ]]; then
 PATH="${PATH:+${PATH}:}/home/patrick/Downloads/fzf/bin"
fi

export FZF_CTRL_T_COMMAND='find ~/personal ~/school type -d'
source <(fzf --zsh)

