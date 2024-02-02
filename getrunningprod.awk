@include "./config.awk"
BEGIN { FS=";"; OFS=""; RS="\r\n"; ORS="\r\n"; servers=getProductionServers(); }
{ print "Invoke-Command -ComputerName "servers" { Get-Service | where { $_.StartType -match \"Auto\" -and $_.Status -eq \"Running\" -and $_.Name -eq \""$1"\" } } | Format-Table -AutoSize" }
