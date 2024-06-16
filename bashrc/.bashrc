#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

RANGER_LOAD_DEFAULT_RC=false

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Custom aliases
alias neofetch='fastfetch'
alias amogus='fastfetch'

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

eval "$(zoxide init bash)"

#######################################################
# TITUS BASH STUFF
#######################################################

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias trash='trash -v'
alias rm='rm -iv'

# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -lcrh'               # sort by change time
alias lu='ls -lurh'               # sort by access time
alias labc='ls -lap'              #alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Display mounted info. see `man df`
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show enp6s0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig enp6s0 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
        echo "";
}
