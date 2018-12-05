<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.155
	 Created on:   	12/4/2018 1:57 PM
	 Created by:   	thimmb
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		Resets the local administrator password on all workstations within a Specific AD OU.
#>

$ModuleRoot = $PSScriptRoot

$FunctionList = Get-ChildItem -Path $ModuleRoot\Functions -Filter *.ps1 -Recurse


foreach ($File in $FunctionList)
{
	. $File.FullName
}

$OUPath= (Get-ModuleConfig).OU
$Computers = Get-ADComputer -Filter * -Searchbase $OUPath

Invoke-Command -ComputerName $Computers -ScriptBlock {('$ModuleRoot\config\netuser.cmd')}
