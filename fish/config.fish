#
# ~/.config/fish/config.fish
#

set -e fish_greeting

. ~/.config/fish/virtual.fish

set -x CDPATH      ./ ~/Development/ ~/Development/develer/ ~/Dropbox ~/Dropbox/Config/ /usr/local/Library/Taps
set -x DEBEMAIL    lorenzo@villani.me
set -x DEBFULLNAME Lorenzo Villani
set -x EDITOR      'subl -n -w'
set -x GEM_HOME    ~/.gem
set -x GIT_EDITOR  nano
set -x GOPATH      ~/.go
set -x NPM_HOME    ~/.npm
set -x PATH        $GEM_HOME/bin $GOPATH/bin $NPM_HOME/bin ~/.local/bin /usr/local/bin /bin /sbin /usr/bin /usr/sbin

alias e="$EDITOR"
alias r=". ~/.config/fish/config.fish"

alias blog="$EDITOR ~/Dropbox/lvillani.github.io/"
alias dotfiles="$EDITOR ~/Dropbox/Config/dotfiles"
