[cmdletBinding()]
param(
[Parameter(Mandatory=$true)][string]$eingabe
)
#Zusätzliche Ausgaben via Write-Verbose
Write-Verbose -Message "Vom User wurde $eingabe übergeben"


Write-Host -Object $eingabe -ForegroundColor Cyan

#Haltepunkt im Skript setzen mit Debug Möglichkeiten der nur beachtet wird wenn das Skript mit -debug aufgerufen wird.
Write-Debug -Message "Postion im Skript"

Write-Host -Object $eingabe -ForegroundColor Magenta