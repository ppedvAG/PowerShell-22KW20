[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
[string]$eingabe
)

Begin
{
    Write-Host -Object "Wird einmalig zum Start ausgeführt" -ForegroundColor Magenta
    #z.B.
    #zum aufbauen von RemoteVerbindungen
    #zum erzeugen von Credential Variablen
    #zur Funktionsdeklaration
}
Process
{#wird für jedes Objekt ausgeführt was von der PipeLine übergeben wird
    Write-Host -Object $eingabe -ForegroundColor Green
}
End
{
    Write-Host -Object "Wird einmalig zum Ende ausgeführt" -ForegroundColor Magenta
    #z.B.
    #zum beenden von Remoteverbindungen
    #zum schließen / löschen von Credentials
}