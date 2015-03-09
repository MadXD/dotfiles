#
# Environment
#

$env:GEM_HOME = "$env:UserProfile\.gem"
$env:GIT_SSH = "$env:SystemDrive\Program Files (x86)\PuTTY\plink.exe"
$env:GOPATH = "$env:UserProfile\Development\Go"
$env:NPM_HOME = "$env:UserProfile\.npm"
$env:PATH = "$env:SystemRoot\System32\WindowsPowerShell\v1.0;$env:SystemRoot\system32;$env:SystemRoot;$env:SystemRoot\System32\Wbem"
$env:SVN_SSH = "$env:SystemDrive\\Program Files (x86)\\PuTTY\\plink.exe"

$env:npm_config_prefix = "$env:NPM_HOME"

$env:PATH = "$env:GEM_HOME\bin;$env:GOPATH\bin;$env:NPM_HOME\bin;$env:SystemDrive\just-install;$env:PATH"

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
