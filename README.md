Dotfiles
========

My dotfiles. The less stuff is here, the better. My philosophy is to stick to defaults as much as
possible, don't make a change unless it is necessary.

Supported platforms:

- OS X 10.9
- Ubuntu 14.04




Installation
------------

Linux:

    wget -q -O- https://raw.githubusercontent.com/lvillani/dotfiles/master/webinstall | bash

OS X:

    curl https://raw.githubusercontent.com/lvillani/dotfiles/master/webinstall | bash

Windows

    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/lvillani/dotfiles/master/webinstall.ps1"))

Generic:

    git clone git://github.com/lvillani/dotfiles.git
    cd dotfiles
    ./install
