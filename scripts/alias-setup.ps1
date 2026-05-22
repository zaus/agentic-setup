<#
.SYNOPSIS
Sets up folder aliases for agent management in Visual Studio Code workspace

.DESCRIPTION
Uh...see synopsis? This script creates junction points (folder aliases) in the current directory for each agent specified in the provided hashtable. Each alias points to a corresponding leaf directory under the user's profile directory, allowing for easy access and management of different agents within a Visual Studio Code workspace.

.PARAMETER Agents
A hashtable containing custom agent mappings where keys are alias names and values are leaf directory names. By default, it includes mappings for popular agents like Copilot, Claude, ChatGPT, and Perplexity.

.EXAMPLE
# Define custom agents map
$CustomAgents = @{
	'myagent' = 'agent-001'
	'devagent' = 'dev-environment'
	'testbot' = 'test-automation'
}

# Call the script with custom agents
& ".\scripts\alias-setup.ps1" -Agents $CustomAgents

# Or do it all in one line
(@{ 'myagent' = 'agent-001'; 'devagent' = 'dev-environment'; 'testbot' = 'test-automation' }) | .\scripts\alias-setup.ps1

.LINK
For more information about agent setup, refer to the agentic-setup documentation.
#>
# 
param (
	[Parameter(Mandatory=$false, ValueFromPipeline=$true)]
    [hashtable]$Agents = @{
		"Copilot" = ".copilot"
		"Claude" = ".claude"
		"ChatGPT" = ".chatgpt"
		"Perplexity" = ".perplexity"
		# add more agents here as needed...
	}
)


function New-AgentJunction {
	param(
		[Parameter(Mandatory=$true)]
		[string]$AgentAliasName,
		
		[Parameter(Mandatory=$true)]
		[string]$TargetLeaf,
		
		[string]$Root = $env:USERPROFILE
	)
	
	$junctionPath = ".\Personal-$AgentAliasName"
	$targetPath = "$Root\$TargetLeaf"
	
	if (Test-Path -Path $targetPath) {
		if (Test-Path -Path $junctionPath) {
			Write-Host "Junction for '$AgentAliasName' already exists" -ForegroundColor Green # Write-Information suppressed by default
		} else {
			New-Item -ItemType Junction -Path $junctionPath -Target $targetPath
		}
	} else {
		Write-Warning "No personal agent directory for $AgentAliasName"
	}
}

# Set them up in a loop if they're all located in the same root directory...
$Agents.GetEnumerator() | ForEach-Object {
	New-AgentJunction -AgentAliasName $_.Key -TargetLeaf $_.Value
}
# ... or if they're located in a different root directory, call them individually:
# New-AgentJunction -AgentAliasName "MyAgent" -TargetLeaf ".myagent" -Root "C:\DifferentRoot"