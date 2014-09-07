#
# Environment
#

$env:GOPATH = "$env:UserProfile\Development\Go"
$env:GIT_SSH = "$env:SystemDrive\Program Files (x86)\PuTTY\plink.exe"
$env:SVN_SSH = "$env:ProgramFiles(x86)\PuTTY\plink.exe"
$env:PATH = "$env:SystemDrive\just-install;$env:PATH"

#
# Functions
#

function env() {
	Get-ChildItem Env:
}

function r() {
	. $PROFILE
}

function s([string] $glob) {
	Get-ChildItem -Recurse -Include $glob
}