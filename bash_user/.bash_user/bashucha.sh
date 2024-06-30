RANGER_LOAD_DEFAULT_RC=false
eval "$(zoxide init bash)"

# ############## #
# Custom aliases #

# Fastfetch/Neofetch
alias neofetch='fastfetch'
alias amogus='fastfetch'

# ssh aliases
alias acerbook='ssh -p 69 -i ~/.ssh/ssh-acerbook-id_ed25519 datucha@192.168.1.59'
alias acerbook-wifi='ssh -p 69 -i ~/.ssh/ssh-acerbook-id_ed25519 datucha@192.168.1.13'
##############

# Git branch name in shell prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt colors
USER_COLOR="\[$(tput setaf 33)\]"
AT_COLOR="\[$(tput setaf 69)\]"
HOSTNAME_COLOR="\[$(tput setaf 105)\]"
WORKSPACE_COLOR="\[$(tput setaf 141)\]"
GIT_BRANCH_COLOR="\[$(tput setaf 37)\]"

export PS1="${USER_COLOR}\u${AT_COLOR}@${HOSTNAME_COLOR}\h ${WORKSPACE_COLOR}\w ${GIT_BRANCH_COLOR}\$(git_branch)\[\033[00m\]$ "

export HSA_OVERRIDE_GFX_VERSION=10.3.0
