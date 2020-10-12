$printers = Get-ADObject -LDAPFilter "(&(objectCategory=printQueue)(objectClass=printQueue))" -Properties Printername,printColor,driverName,Objectguid `
| Where-Object {($_.printColor -eq $true) -and ($_.driverName -like "* PCL6 Driver for Universal Print") } `
| select objectguid -ExpandProperty objectguid
 

foreach ($Printer in $Printers){
            Set-ADObject -Identity $Printer -Replace @{printColor=$false}
            }    

