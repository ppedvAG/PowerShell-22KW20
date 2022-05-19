[cmdletBinding(DefaultParameterSetName="Text")]
param(

[Parameter(ParameterSetName="Zahl", Mandatory=$true)]
[int]$zahleninput,

[Parameter(ParameterSetName="Text", Mandatory=$true)]
[string]$textinput,

[Parameter(ParameterSetName="Zahl", Mandatory=$true)]
[Parameter(ParameterSetName="Text", Mandatory=$false)]
[string]$farbe

)
