#
# ~/.config/fish/config.fish
#

set -e fish_greeting

source "$HOME/.config/fish/autojump/bin/autojump.fish"
source "$HOME/.config/fish/virtualfish/virtualfish/auto_activation.fish"
source "$HOME/.config/fish/virtualfish/virtualfish/virtual.fish"

#
# Colors! (NOTE: Needed on Linux)
#

set -U fish_color_cwd -o green
set -U fish_color_error -o red
set -U fish_color_host -o cyan
set -U fish_color_user -o green

#
# Environment
#

set -e LC_CTYPE

set -x DEBEMAIL "lorenzo@villani.me"
set -x DEBFULLNAME "Lorenzo Villani"
set -x EDITOR "subl -n -w"
set -x GEM_HOME "$HOME/.gem"
set -x GOPATH "$HOME/Development/Go"
set -x npm_config_prefix "$NPM_HOME"
set -x NPM_HOME "$HOME/.npm"
set -x PATH "$GEM_HOME/bin" "$GOPATH/bin" "$NPM_HOME/bin" "$HOME/.local/bin" "$HOME/.config/fish/autojump/bin" "/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" "/sbin"
set -x PIP_ALLOW_ALL_EXTERNAL 1
set -x PIP_USER 1
set -x VAGRANT_DEFAULT_PROVIDER "vmware_fusion"
set -x VAGRANT_VMWARE_CLONE_DIRECTORY "$HOME/.vagrant.d/vmware"
set -x VAGRANT_VMWARE_FUSION_APP "$HOME/Applications/VMware Fusion.app"

if test -n "$VIRTUAL_ENV"
    set -e PIP_USER
    set -x PATH "$VIRTUAL_ENV/bin" $PATH
end

#
# CDPATH
#

set -U CDPATH . "$HOME"

for cdentry in "$GOPATH/src" "$HOME/Development" "$HOME/Development/develer"
    if test -d $cdentry
        set -U CDPATH $CDPATH $cdentry
    end
end


#
# Aliases
#

alias b="$EDITOR -n ~/Development/lvillani.github.io"
alias d="$EDITOR -n ~/Development/dotfiles"
alias r="source ~/.config/fish/config.fish"

if test -x "/usr/local/bin/hub"
    alias git="hub"
end
