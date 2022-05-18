[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$ComputerName = "localhost"
)

#Write-Verbose ermöglicht mir zusätzliche Informationen auszugeben wenn das Skript mit -verbose aufgerufen wird
Write-Verbose -Message "Vom User wurde folgendes angegeben: $EventId | $Newest | $ComputerName" 

Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest


