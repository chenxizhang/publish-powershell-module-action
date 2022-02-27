#!/usr/bin/env pwsh

Write-Host $env:INPUT_MODULEPATH
Write-Host $env:INPUT_NUGETAPIKEY
Write-Host $env:INPUT_DEPENDENCIES

Get-ChildItem -Path env:
Write-Host -Object ('Publishing module ({0}) to PowerShell Gallery' -f $env:INPUT_MODULEPATH)
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

if([string]::IsNullOrEmpty($env:INPUT_DEPENDENCIES) -ne $true){
    Install-Module $env:INPUT_DEPENDENCIES.split(',')
}


Publish-Module -Path $env:INPUT_MODULEPATH -NuGetApiKey $env:INPUT_NUGETAPIKEY
Write-Host -Object 'Finished publishing module to PowerShell Gallery'
