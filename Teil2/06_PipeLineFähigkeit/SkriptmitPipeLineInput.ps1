<#
.SYNOPSIS
Beispiel für PipeLine Annahme
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeLine=$true,ValueFromPipeLineByPropertyName=$true)]
[string]$Name,

[Parameter(ValueFromRemainingArguments=$true)]
$rest

)

Write-Host -Object $Name -ForegroundColor Magenta