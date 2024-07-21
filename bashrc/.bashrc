#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/screen_layouts.sh
source ~/bashucha.sh
source /usr/share/nvm/init-nvm.sh
