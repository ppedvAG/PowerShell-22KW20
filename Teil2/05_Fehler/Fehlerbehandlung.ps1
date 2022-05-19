[cmdletBinding()]
param(

)

Write-Host -Object "Text1"

#nicht terminierender Fehler
Stop-Process -Name bliblablop 

Write-Host -Object "Text2"

#Im Try Block möglichst nur eine AKtion. Der Try fängt bloß terminierende Fehler
try{
#terminierender Fehler durch ErrorAction
Stop-Process -Name bliblablop -ErrorAction Stop
}
catch #was soll im Fehlerfall passieren 
{
    Write-Host -Object "Passiert im Fehlerfall"
}
finally
{
    Write-Host -Object "Wird immer ausgegeben"
}


Write-Host -Object "Text3"