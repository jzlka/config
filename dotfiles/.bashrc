#
# ~/.bashrc
#
# TODO: 159:escape spaces in PS1 and align

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash



# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
export MACHINE

PROJECT_ROOT="$PWD"
if [[ "$MACHINE" == "Linux" ]];then
	file="$PROJECT_ROOT/.sh-aliases-linux.sh"
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
	unset file;
elif [[ "$MACHINE" == "Mac" ]]; then
	file="$PROJECT_ROOT/.sh-aliases-mac.sh"
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
	unset file;
fi

for file in $PROJECT_ROOT/{.sh-exports,.sh-aliases-shared,.sh-functions,.sh-extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


#	*** Bash history ***
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;



#	*** Others ***
#aby crontab mohol spustat X aplikacie
#xhost local:ja > /dev/null


#eval $(keychain --eval --noask --clear --quiet ~/.ssh/github_rsa)
#eval $(keychain --eval --quiet --noask ~/.ssh/github_rsa)


# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;


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



#ssh-add -A 2>/dev/null;
