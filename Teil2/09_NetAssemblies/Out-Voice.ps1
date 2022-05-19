[cmdletBinding()]
param(
    [ValidateLength(1,5000)]
    [Parameter(Mandatory=$true)]
    [string]$text
)

do
{
$audiosrv = Get-Service -Name Audiosrv

if($audiosrv.Status -ne "Running")
{
    $audiosrv.Start()
    Start-Sleep -Milliseconds 15
}
$audiosrv.Refresh()
}until($audiosrv.Status -eq "Running")


#Laden der Assembly oder DLLs
Add-Type -AssemblyName System.Speech

#Instanzieren des Objekts SpeechSynthesizer
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

$speak.Speak($text)

$speak.Dispose()