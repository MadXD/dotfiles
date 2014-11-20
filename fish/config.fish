#
# ~/.config/fish/config.fish
#

set -e fish_greeting

source "$HOME/.config/fish/virtualfish/virtual.fish"
source "$HOME/.config/fish/virtualfish/auto_activation.fish"

#
# CDPATH
#

set -U CDPATH . "$HOME"

for cdentry in "$HOME/Development" "$HOME/Development/develer"
    if test -d $cdentry
        set -U CDPATH $CDPATH $cdentry
    end
end

#
# Environment
#

set -x DEBEMAIL    "lorenzo@villani.me"
set -x DEBFULLNAME "Lorenzo Villani"
set -x EDITOR      "subl"
set -x GEM_HOME    "$HOME/.gem"
set -x GIT_EDITOR  "nano"
set -x GOPATH      "$HOME/.go"
set -x LPASS_AGENT_TIMEOUT 28800  # 8 hours
set -x NPM_HOME    "$HOME/.npm"
set -x VAGRANT_DEFAULT_PROVIDER       "vmware_fusion"
set -x VAGRANT_VMWARE_CLONE_DIRECTORY "$HOME/.vagrant.d/vmware"
set -x VAGRANT_VMWARE_FUSION_APP      "$HOME/Applications/VMware Fusion.app"

set -x npm_config_prefix "$NPM_HOME"

if test -n "$VIRTUAL_ENV"
    set -x PATH "$VIRTUAL_ENV/bin" "/usr/local/bin" "$PATH"
else
    set -x PATH "$GEM_HOME/bin" "$GOPATH/bin" "$NPM_HOME/bin" "$HOME/.local/bin" "/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" "/sbin"
end

#
# Aliases
#

alias b="$EDITOR -n ~/Development/lvillani.github.io"
alias d="$EDITOR -n ~/Development/dotfiles"
alias p="lpass show --clip --password"
alias r="source ~/.config/fish/config.fish"
