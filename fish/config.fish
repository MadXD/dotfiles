#
# ~/.config/fish/config.fish
#

set -e fish_greeting

source "$HOME/.config/fish/autojump/bin/autojump.fish"
source "$HOME/.config/fish/virtualfish/virtualfish/auto_activation.fish"
source "$HOME/.config/fish/virtualfish/virtualfish/virtual.fish"

#
# Environment
#

set -x DEBEMAIL "lorenzo@villani.me"
set -x DEBFULLNAME "Lorenzo Villani"
set -x EDITOR "subl -n -w"
set -x GEM_HOME "$HOME/.gem"
set -x GOPATH "$HOME/Development/Go"
set -x NPM_HOME "$HOME/.npm"
set -x PIP_ALLOW_ALL_EXTERNAL 1
set -x PIP_USER 1
set -x VAGRANT_DEFAULT_PROVIDER "vmware_fusion"
set -x VAGRANT_VMWARE_CLONE_DIRECTORY "$HOME/.vagrant.d/vmware"
set -x VAGRANT_VMWARE_FUSION_APP "$HOME/Applications/VMware Fusion.app"
set -x npm_config_prefix "$NPM_HOME"

#
# Path
#

if test -n "$VIRTUAL_ENV"
    set -e PIP_USER
else
    set -x PATH "$HOME/.local/bin" "/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" "/sbin"
    set -x PATH "$GEM_HOME/bin" "$GOPATH/bin" "$HOME/.config/fish/autojump/bin" "$NPM_HOME/bin" $PATH
end

#
# Aliases
#

alias b="$EDITOR -n $HOME/Development/lvillani.github.io"
alias d="$EDITOR -n $HOME/Development/dotfiles"
alias r="source $HOME/.config/fish/config.fish"

#
# Platform: Linux
#

if test -z "$XPC_FLAGS"
    set -U fish_color_cwd   -o green
    set -U fish_color_error -o red
    set -U fish_color_host  -o cyan
    set -U fish_color_user  -o green
end

#
# Platform: OS X
#

if test -n "$XPC_FLAGS"
    set -e LC_CTYPE

    if test -z "$VIRTUAL_ENV"
        set -x PATH "$HOME/Library/Python/2.7/bin" $PATH
    end
end
