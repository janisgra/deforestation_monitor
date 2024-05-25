using namespace System.Collections.Generic

<#
General to PS-scripting:

Suppressing of outputs:
[void]$array_name.Add("lxlk")         #Casting to void
$array_name.Add("lxlk...") > $null    #Redirect to $null
$array_name.Add("lxlk...") | out-null #(Piping) Out-Null
$null = array_name.Add("lxlk...")     #Assign to $null
#https://docs.microsoft.com/de-de/powershell/scripting/learn/deep-dives/everything-about-null?view=powershell-7.2

Performance: Array.foreach({}) > foreach($i in $array){} > Foreach-Object
Resource: https://adamtheautomator.com/powershell-foreach/#ForEach_PowerShell_Examples

Copying Objects in a new data structure: 
$IPhashTmp = [System.Object[]]::new(1000); $IPhash.CopyTo($IPhashTmp, 0)

Ways to initialize Objects:
$tmp = [System.Object]::new() > $tmp = New-Object System.Object
$ping = New-Object -TypeName System.Net.NetworkInformation.Ping

ArrayList are deprecated and should replaced with System.Collections.Generic.List -> generic List > ArrayList
Resource: https://docs.microsoft.com/de-de/dotnet/api/system.collections.arraylist?view=net-6.0#remarks

outstanding improvements in C#-Code: using async-mehtods: https://belsham.tech/2015/12/07/pinging-from-powershell/
#>

Write-Host "Task 1: Get data from Suppliers.csv"
$cbdb_servername = [System.Text.StringBuilder]::new()
$anzeigeID = [List[string]]::new()
try{
	$EUDR_Data = Import-Csv -Delimiter "," -Path D:\EUDR_Data.csv
    $Production_Sites = Import-Csv -Delimiter "," -Path D:\Production_Sites.csv
    $Suppliers = Import-Csv -Delimiter "," -Path D:\Suppliers.csv

    $Suppliers.ForEach({
        Write-Output $PSItem.country
    })
}catch{
	$PSItem.Exception#.Message
	$PSItem.ScriptStackTrace
	$PSItem.InvocationInfo.MyCommand
}

# $return | Export-Csv 'D:\data.csv' -Delimiter ';' -NoTypeInformation