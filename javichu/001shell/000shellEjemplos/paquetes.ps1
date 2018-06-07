clear
write-host "Programa que visualiza los paquetes instalados en el equipo y permite borrarlos"

$paquetes=get-package
foreach ($paquete in $paquetes)
{

   write-host $paquete.source ..>>>>>> $paquete.name..>>>> $paquete.status
   $confirma =Read-Host "Desea desistalarlo s/N"
   if ($confirma -eq "s"){
        
        $confirma =Read-Host "Realmente desea desistalarlo s/N"
        if ($confirma -eq "s"){
        
            Uninstall-Package $paquete.Name
        }
    }




}