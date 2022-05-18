<#
.Synopsis
   Kurzbeschreibung des Skriptes
.DESCRIPTION
   Lange Beschreibung was das Skript genau macht und wieso
.PARAMETER EventId
   Folgende Werte sind möglich:
   4624: Anmeldung
   4625: fehlgeschlagene Anmeldung
   4634: Abmeldung
.EXAMPLE
get-eventlog.ps1 -EventId 4624

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   24974 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24971 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24968 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24965 Mai 18 13:52  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24962 Mai 18 13:51  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.EXAMPLE
get-eventlog.ps1 -EventId 4624 -Verbose
AUSFÜHRLICH: Vom User wurde folgendes angegeben: 4624 | 5 | localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   24974 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24971 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24968 Mai 18 13:53  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24965 Mai 18 13:52  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   24962 Mai 18 13:51  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)] 
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 5,

[string]$ComputerName = "localhost"
)

$EventId = 3

#Write-Verbose ermöglicht mir zusätzliche Informationen auszugeben wenn das Skript mit -verbose aufgerufen wird
Write-Verbose -Message "Vom User wurde folgendes angegeben: $EventId | $Newest | $ComputerName" 

Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest


