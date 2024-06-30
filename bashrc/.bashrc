#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.bash_user/christitus.sh
source ~/.bash_user/bashucha.sh
source /usr/share/nvm/init-nvm.sh
