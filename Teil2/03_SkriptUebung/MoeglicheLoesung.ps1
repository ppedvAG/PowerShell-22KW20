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

if($Path.EndsWith("\"))
{
    [string]$TestDirPath = $Path + $DirName
}
else
{
    [string]$TestDirPath = $Path + "\$DirName"
}

if(Test-Path -Path $TestDirPath -PathType Container)
{
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
for($i = 1; $i -le $FileCount; $i++)
{
    $FileName = "File" + ("{0:D3}" -f $i) + ".txt"
    New-Item -Path $TestDir.FullName -Name $FileName -ItemType File
}

#Ordner für Testfiles Root Verzeichnis
for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = ("{0:D3}" -f $i)
    $DirName = "Directory" + $DirNumber
    $Dir = New-Item -Path $TestDir.FullName -Name $DirName -ItemType Directory

    for($j = 1; $j -le $FileCount; $j++)
    {
        $FileNumber = ("{0:D3}" -f $j)
        $FileName = "Dir" + $DirNumber + "File" + $FileNumber + ".txt"

        New-Item -Path $Dir.FullName -Name $FileName -ItemType File
    }
}