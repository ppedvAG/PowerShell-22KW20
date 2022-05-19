
Write-Error -Message "Nicht terminierenden Fehler erzeugen"

throw "Einen Terminierenden Fehler werfen "

Write-Host -Object "Testausgabe die nicht ausgegeben wird weil throw einen terminierenden Fehler wirft"
