#In einem PowerShell Profil sollte alles als Function definiert werden und aufgerufen werden.
function Get-RandomFact
{
    Invoke-RestMethod -UseBasicParsing http://numbersapi.com/random
}
Get-RandomFact

#überschreiben der Prompt Funktion die bei jeder neuen Zeile aufgerufen wird.
function prompt
{
    $Time = (Get-Date).ToShortTimeString()
    $Pfad = Get-Location
    if($Pfad.Path.Length -lt 30)
    {
        Write-Host -Object "[$Time]$Pfad" -NoNewline
    }
    else
    {
        Write-Host $Pfad
        Write-Host -Object "[$Time]" -NoNewline
    }
}