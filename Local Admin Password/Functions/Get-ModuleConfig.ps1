<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.155
	 Created on:   	11/30/2018 2:29 PM
	 Created by:   	thimmb
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Function Get-ModuleConfig
{
	[CmdletBinding()]
	param
	([string]$Environment = 'BLUE'
	)
	$ConfigPath = '{0}\Config\Config.{1}.json' -f $ModuleRoot, $Environment
	
	if (!([System.IO.File]::Exists($ConfigPath)))
	{
		throw 'Configuration file {0} could not be accessed. Please verify existence and access to file.' -f $ConfigPath
	}
	Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
}