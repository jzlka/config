#
# ~/.bashrc
#
# TODO: 159:escape spaces in PS1 and align

PATH="/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:$PATH"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash



#	*** Variables ***
export EDITOR="vim"
export LS_COLORS=$LS_COLORS:'di=1;33:ow=01;33:'
#LS_COLORS=$LS_COLORS:'di=1;33:ow=01;36:'; export LS_COLORS

# Define some colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset



#	*** Bash aliases ***
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi



#	*** Bash history ***
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=30000  #default nastavi na velkost HISTSIZE

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize



#	*** Others ***
#aby crontab mohol spustat X aplikacie
#xhost local:ja > /dev/null


#eval $(keychain --eval --noask --clear --quiet ~/.ssh/github_rsa)
#eval $(keychain --eval --quiet --noask ~/.ssh/github_rsa)



#	*** ? ***
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#	*** set PS1 ***
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
##  [user@hostname W]$-WHITE		{ARCH}
#    PS1='[\u@\h \W]\$ '

##  hostname:W user$-WHITE		{OSX}
#    PS1='\h:\W \u\$ '

##  user-WHITE, @-GREY, hostname-BOLD_GREEN, :-WHITE, w-BOLD_BLUE, $-WHITE
#    PS1='\u\[\033[01;30m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

##  user@hostname-BOLD GREEN, :-WHITE, w-BOLD_BLUE, $-WHITE
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

##  [user@hostname W]$-BOLD_GREEN 	{CRUNCHBANG}
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\u@\h: \W]\$ \[\e[0m\]' 

##  [user@hostname W]$-GREEN      	{CRUNCHBANG}
#    PS1='\[\033[0;32m\][\u@\h: \W]\$ \[\e[0m\]' 

### return value visualisation
##  ERR_CODE-WHITE, $?-BOLD GREEN, user@hostname-GREEN, w $-BLUE
#    PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[0;32m\]\u@\h'; fi)\[\033[0;34m\] \w \$\[\033[00m\] " 

##  $? [user@hostname-BOLD_GREEN, W-BLUE, ]-BOLD_GREEN, $-BLUE
#    PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\][\h'; else echo '\[\033[01;32m\][\u@\h'; fi)\[\033[0;34m\] \W\[\033[01;32m\]] \[\033[0;34m\]\$\[\033[00m\] "

##  $? user@hostname-GREEN, W $-BLUE
    PS1="\$(if [[ \$? == 0 ]];then 
		echo \"\[\033[01;32m\]\342\234\223\"; 
	   else 
		echo \"\[\033[01;31m\]\342\234\227\"; fi) \
$(if [[ ${EUID} == 0 ]];then 
		echo '\[\033[01;31m\]\h'; 
	   else 
		echo '\[\e[0;32m\]\u@\h'; 
	   fi)\[\e[0;34m\] \W \$\[\033[00m\] "

else 		# \ if [ "$color_prompt" = yes ];then \
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='[\u@\h \W]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



#	*** Extract function ***
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tar.xz)    tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
