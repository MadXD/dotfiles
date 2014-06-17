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
set -x PATH        $GEM_HOME/bin $GOPATH/bin $NPM_HOME/bin ~/.local/bin /usr/local/bin /bin /sbin /usr/bin /usr/sbin

#
# Aliases
#

alias blog="$EDITOR ~/Dropbox/lvillani.github.io/"
alias dotfiles="$EDITOR ~/Dropbox/Config/dotfiles"
alias e="$EDITOR"
alias r=". ~/.config/fish/config.fish"
