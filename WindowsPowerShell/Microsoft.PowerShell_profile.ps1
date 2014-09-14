#
# Environment
#

$env:GIT_SSH = "$env:SystemDrive\Program Files (x86)\PuTTY\plink.exe"
$env:GOPATH = "$env:UserProfile\Development\Go"
$env:PATH = "$env:SystemRoot\System32\WindowsPowerShell\v1.0;$env:SystemRoot\system32;$env:SystemRoot;$env:SystemRoot\System32\Wbem"
$env:SVN_SSH = "$env:SystemDrive\\Program Files (x86)\\PuTTY\\plink.exe"

$env:PATH = "$env:SystemDrive\just-install;$env:PATH"

#
# Functions
#

function env() {
	Get-ChildItem Env:
}

function reload() {
	. $PROFILE
}

function s([string] $glob) {
	Get-ChildItem -Recurse -Include $glob
}
