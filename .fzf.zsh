# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/patrickmuller/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/patrickmuller/bin"
fi

export FZF_CTRL_T_COMMAND='find ~/personal ~/school'

eval "$(fzf --zsh)"

