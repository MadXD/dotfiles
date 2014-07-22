#
# ~/.config/fish/config.fish
#

set -e fish_greeting

. ~/.config/fish/virtual.fish

#
# CDPATH
#

set -x CDPATH ./

for cdentry in ~/Development/ ~/Development/develer/ ~/Dropbox ~/Dropbox/Config/ /usr/local/Library/Taps
    if test -d $cdentry
        set -x CDPATH $CDPATH $cdentry
    end
end

#
# Environment
#

set -x DEBEMAIL    'lorenzo@villani.me'
set -x DEBFULLNAME 'Lorenzo Villani'
set -x EDITOR      'subl -n -w'
set -x GEM_HOME    ~/.gem
set -x GIT_EDITOR  nano
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
alias r=". ~/.config/fish/config.fish"
alias search="find . -type f -iname"
