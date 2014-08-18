#
# ~/.config/fish/config.fish
#

set -e fish_greeting

source ~/.config/fish/virtualfish/virtual.fish
source ~/.config/fish/virtualfish/auto_activation.fish

#
# CDPATH
#

set -x CDPATH ./

for cdentry in ~/Development/ ~/Development/develer/ ~/Dropbox
    if test -d $cdentry
        set -x CDPATH $CDPATH $cdentry
    end
end

#
# Environment
#

set -x DEBEMAIL    lorenzo@villani.me
set -x DEBFULLNAME "Lorenzo Villani"
set -x EDITOR "emacsclient -c -a ''"
set -x GEM_HOME    ~/.gem
set -x GIT_EDITOR "emacsclient -nw -a ''"
set -x GOPATH      ~/.go
set -x NPM_HOME    ~/.npm
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
set -x VAGRANT_VMWARE_CLONE_DIRECTORY ~/.vagrant.d/vmware
set -x VAGRANT_VMWARE_FUSION_APP ~/Applications/VMware\ Fusion.app

# Override PATH only if we are not inside a Python Virtualenv, in which case we want to pick the
# python executable from its path.
if test -z "$VIRTUAL_ENV" -a -z "$COMELZ_QT_SDK_SETUP_DONE"
    set -x PATH $GEM_HOME/bin $GOPATH/bin $NPM_HOME/bin ~/.local/bin /usr/local/bin /bin /sbin /usr/bin /usr/sbin
end

#
# Aliases
#

alias blog="$EDITOR ~/Dropbox/lvillani.github.io/"
alias dotfiles="$EDITOR ~/Dropbox/Config/dotfiles"
alias e="$EDITOR"
alias mai="make ; and make install"
alias r=". ~/.config/fish/config.fish"
alias search="find . -type f -iname"

if test -x /usr/local/bin/hub
    alias git="hub"
end
