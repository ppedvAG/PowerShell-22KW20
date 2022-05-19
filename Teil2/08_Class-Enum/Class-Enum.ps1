class Fahrzeug
{
    [ValidateRange(1800,2022)]
    [int]$Baujahr

    [ValidateLength(2,20)]
    [string]$Hersteller
}

#Die Klasse Auto erbt die Eigenschaften der Klasse Fahrzeug
class Auto : Fahrzeug
{
    [ValidateRange(0,1000)]
    [int]$PS 

    [ValidateLength(2,20)]
    [string]$Modell

    [ValidateRange(0,8)]
    [int]$AnzahlRäder

    [Kraftstofftyp]$Kraftstoff

    hidden [DateTime]$Creation

    #Konstruktoren werden beim erstellen der Instanz ausgeführt
    #Dieser Konstruktor wird verwendet wenn kein Wert übergeben wird
    Auto ()
    {
        $this.Creation = Get-Date
    }

    #Dieser Konstruktor wird verwendet wenn zwei Strings übergeben werden
    Auto ([string]$Marke,[string]$Modell)
    {
        $this.Creation = Get-Date
        $this.Hersteller = $Marke
        $this.Modell = $Modell
    }

    #Methoden sollten einen definierten RückgabeWert haben. Rückgabe werden mit return übergeben
    [string] Fahre([int]$Weite)
    {
        [string]$strecke = "🚗-"
        for($i = 1; $i -le $Weite; $i++)
        {
            $strecke = "-" + $strecke
        }
        return $strecke
    }

    [string] ToString()
    {
        [string]$Ausgabe = $this.Hersteller + " | " + $this.Modell

        return $Ausgabe
    }
}

Enum KraftstoffTyp
{
    Benzin 
    Diesel
    Wasserstoff
    LPG
    CNG
    Elektrizität
    Hybrid = 10
}

#Hier wird eine neue Instanz der Klasse Auto erzeugt mit zwei Parametern welche dem Konstruktor übergeben werden
$bmw = [Auto]::new("BMW","F31")

#Setzen einer Eigenschaft
$bmw.PS = 4

#Setzen des Enums Kraftstoff über die direkte Angabe
$bmw.Kraftstoff = [KraftstoffTyp]::Benzin