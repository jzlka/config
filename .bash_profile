#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

##
# Your previous /Users/ja/.bash_profile file was backed up as /Users/ja/.bash_profile.macports-saved_2017-01-28_at_18:40:15
##

# MacPorts Installer addition on 2017-01-28_at_18:40:15: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

