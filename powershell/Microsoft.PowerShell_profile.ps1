#
# Environment
#

$env:GEM_HOME = "$env:UserProfile\\.gem"
$env:GIT_SSH = "$env:SystemDrive\\Shims\\plink.exe"
$env:GOPATH = "$env:UserProfile\\Development\\Go"
$env:NPM_HOME = "$env:UserProfile\\.npm"
$env:SVN_SSH = "$env:SystemDrive\\Shims\\plink.exe"
$env:npm_config_prefix = "$env:NPM_HOME"

#
# Path
#

$env:PATH = "$env:SystemRoot\System32\WindowsPowerShell\v1.0;$env:SystemRoot\system32;$env:SystemRoot;$env:SystemRoot\System32\Wbem"
$env:PATH = "$env:GEM_HOME\bin;$env:GOPATH\bin;$env:NPM_HOME\bin;$env:SystemDrive\Shims;$env:PATH"

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
