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
		Resets the local administrator password on all workstations within a Specific AD OU
#>

$ModuleRoot = $PSScriptRoot

$FunctionList = Get-ChildItem -Path $ModuleRoot\Functions -Filter *.ps1 -Recurse


foreach ($File in $FunctionList)
{
	. $File.FullName
}

$GetModuleConfig = Get-ModuleConfig
$Computers = Get-ADComputer -Filter * -Searchbase $GetModuleConfig.OU

foreach ($computer in $computers)
{
	
	Try
	{
		Invoke-Command -ComputerName $Computer.name -ScriptBlock ('$ModuleRoot\config\netuser.cmd') -ErrorAction Stop
	}
	Catch
	{
		$Computer.name | Out-File "$ModuleRoot\FailFile.txt" -append
	}
}
