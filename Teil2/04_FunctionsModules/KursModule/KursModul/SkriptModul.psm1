function New-TestFilesDir
{
[cmdletBinding()]
param(

[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(1,10)]
[int]$DirCount = 3,

[ValidateRange(1,10)]
[int]$FileCount = 9,

[ValidateLength(3,20)]
[string]$DirName = "TestFiles",

[switch]$Force

)

#Beispiel für Input Sanitation zum sicherstellen das Pfad korrekt erstellt werden kann.
if($Path.EndsWith("\"))
{
    [string]$TestDirPath = $Path + $DirName
}
else
{
    [string]$TestDirPath = $Path + "\$DirName"
}

#Prüfen ob Ordner vorhanden ist
if(Test-Path -Path $TestDirPath -PathType Container)
{#wenn das Skript mit Force aufgerufen wurde , löschen des Ordners
    if($Force)
    {
        Remove-Item -Path $TestDirPath -Force -Recurse
    }
    else
    {
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden"
        exit
    }
}

$TestDir = New-Item -Path $Path -Name $DirName -ItemType Directory 

#Dateien für TestFiles "Root" Verzeichnis
New-TestFiles -Path $TestDir.FullName -FileCount $FileCount 

#Ordner für Testfiles Root Verzeichnis
for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = ("{0:D3}" -f $i)
    $DirName = "Directory" + $DirNumber
    $Dir = New-Item -Path $TestDir.FullName -Name $DirName -ItemType Directory

    New-TestFiles -Path $Dir.FullName -FileBaseName ("Dir" + $DirNumber + "File") -FileCount $FileCount
}
}

function New-TestFiles
{
[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(1,10)]
[int]$FileCount = 9,


[ValidateLength(3,20)]
[string]$FileBaseName = "File"
)

    for($i = 1; $i -le $FileCount; $i++)
    {
        $FileNumber = ("{0:D3}" -f $i)
        $FileName = $FileBaseName + $FileNumber + ".txt"

        New-Item -Path $Path -Name $FileName -ItemType File | Out-Null
    } 
}
