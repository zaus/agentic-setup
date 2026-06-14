<#
.SYNOPSIS
	Validates PowerShell scripts and syntax.

.DESCRIPTION
	This script provides validation functionality for PowerShell scripts, checking for syntax errors and common issues.

.NOTES
	File: powershell-validate.ps1
	Location: ~/.agents/skills/powershell-validate/scripts/

.EXAMPLE
	& ./powershell-validate.ps1

#>
param(
	[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
	[string]$Path,
	[Parameter(Mandatory = $false, Position = 1)]
	[string]$Filter = '*.ps1'
)

$errors = @()
Get-ChildItem -LiteralPath $Path -Filter $Filter | ForEach-Object {
	$tokens = $null
	$parseErrors = $null
	[System.Management.Automation.Language.Parser]::ParseFile($_.FullName, [ref]$tokens, [ref]$parseErrors) | Out-Null
	if ($parseErrors) {
		foreach ($err in $parseErrors) {
			$errors += "{0}: {1} ({2})" -f $_.Name, $err.Message, $err.Extent.Text
		}
	}
}
if ($errors.Count -gt 0) {
	$errors | ForEach-Object { Write-Host $_ }
	throw 'PowerShell parse validation failed.'
}
'PowerShell parse validation passed.'