# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# 	==- ls -==
alias ls='ls --color -F'
alias ll='ls -lha'
alias la='ls -A'
#alias l='ls -CF'


# 	==- rm -==
# alias rm='rm -i'
# alias rm='mv \!* ~/.trash'


# 	==- grep -==
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'


#	==- vim -==
#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias gvi='/Applications/MacVim.app/Contents/MacOS/Vim -g'
#alias vim='/usr/local/Cellar/vim/7.4.998/bin/vim'
#alias vim='/Users/ja/bin/mvim'


#   ==- cd -==
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."


#	==- ine -==
#alias massif-visualizer='/Applications/MacPorts/KDE4/massif-visualizer.app/Contents/MacOS/massif-visualizer'
#if [ ! -d ~/.trash ]; then 
#    mkdir ~/.trash
#fi
#alias del='mv \!* ~/.trash'


# 	==- pacman -==
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'		# Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacown="pacman -Qo"		# Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacclean='sudo pacman -R $(pacman -Qdtq)'
alias inkspace='/usr/local/Cellar/inkscape/0.92.1/bin/inkscape'
