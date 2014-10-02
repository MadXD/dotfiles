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
set -x EDITOR      subl
set -x GEM_HOME    ~/.gem
set -x GIT_EDITOR  nano
set -x GOPATH      ~/.go
set -x npm_config_prefix $NPM_HOME
set -x NPM_HOME    ~/.npm
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
set -x VAGRANT_VMWARE_CLONE_DIRECTORY ~/.vagrant.d/vmware
set -x VAGRANT_VMWARE_FUSION_APP ~/Applications/VMware\ Fusion.app

if test -n "$VIRTUAL_ENV"
    set -x PATH $VIRTUAL_ENV/bin /usr/local/bin $PATH
else if test -n "$WINDIR"
    set -x GIT_SSH "C:\Program Files (x86)\PuTTY\plink.exe"
    set -x PATH ~/.local/bin /usr/bin /bin /cygdrive/C/just-install /cygdrive/C/Windows
else
    set -x PATH $GEM_HOME/bin $GOPATH/bin $NPM_HOME/bin ~/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
end

#
# Aliases
#

alias b="$EDITOR -n ~/Development/lvillani.github.io"
alias d="$EDITOR -n ~/Development/dotfiles"
alias e="$EDITOR"
alias ee="$EDITOR -n"
alias g="git"
alias m="make; and make install"
alias r="source ~/.config/fish/config.fish"
alias s="find . -type f -iname"
alias sd="find . -type d -iname"
alias v="vagrant"
alias vd="vagrant destroy -f"
alias vh="vagrant halt"
alias vp="vagrant provision"
alias vup="vagrant up"
