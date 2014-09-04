#
# ~/.config/fish/config.fish
#

set -e fish_greeting

source ~/.config/fish/virtualfish/virtual.fish
source ~/.config/fish/virtualfish/auto_activation.fish

#
# CDPATH
#

set -U CDPATH . "$HOME"

for cdentry in ~/Development/ ~/Development/develer/
    if test -d $cdentry
        set -U CDPATH $CDPATH $cdentry
    end
end

#
# Environment
#

set -e LC_CTYPE  # Work-around OS X bug

set -x DEBEMAIL    "lorenzo@villani.me"
set -x DEBFULLNAME "Lorenzo Villani"
set -x EDITOR      "emacsclient -c -a ''"
set -x GEM_HOME    ~/.gem
set -x GOPATH      ~/.go
set -x NPM_HOME    ~/.npm
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
set -x VAGRANT_VMWARE_CLONE_DIRECTORY ~/.vagrant.d/vmware
set -x VAGRANT_VMWARE_FUSION_APP ~/Applications/VMware\ Fusion.app
set -x npm_config_prefix $NPM_HOME

if test -n "$VIRTUAL_ENV"
    set -x PATH $VIRTUAL_ENV/bin /usr/local/bin $PATH
else
    set -x PATH $GEM_HOME/bin $GOPATH/bin $NPM_HOME/bin ~/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
end

#
# Aliases
#

alias e="$EDITOR"
alias g="git"
alias m="make; and make install"
alias r="source ~/.config/fish/config.fish"
alias s="find . -type f -iname"
