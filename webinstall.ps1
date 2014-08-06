#
# Dotfiles setup script for Windows
#

${DEVELOPMENT_DIR} = "${env:UserProfile}\\Development"
${DOTFILES_DIR} = "${DEVELOPMENT_DIR}\\dotfiles"

#
# Prepare the machine by using just-install (http://www.just-install.it/) to install Git and Python
#

(New-Object System.Net.WebClient).DownloadFile("http://go.just-install.it", "${env:WinDir}\\just-install.exe")

just-install update
just-install git python27

#
# Clone dotfiles
#

mkdir -p ${DEVELOPMENT_DIR}

& "${env:ProgramFiles(x86)}\\Git\\bin\\git.exe" clone git://github.com/lvillani/dotfiles.git "${DOTFILES_DIR}"

#
# Install dotfiles
#

pushd "${DOTFILES_DIR}"
& "${env:SystemDrive}\\Python27\\python.exe" install
popd
