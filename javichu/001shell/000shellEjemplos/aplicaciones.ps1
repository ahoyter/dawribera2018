####################################
# Autor: 
# Descripción: 
# EJERCICIO: 
# Fecha: 
####################################

clear
Write-Host "LISTADO DE LAS APLICACIONES`n"
Write-Host "Nombre del paquete`t`tOrigen`t`tEstado"
Write-Host "==================`t`t======`t`t======"
$count=1
$packages=get-package
#Recorremos de línea en línea
foreach ($u in $packages)
{
    $name= $u.name
    $source=$u.source
    $status=$u.status

    if ($source -eq "")
    {
    $source="Sin ruta"
    }

    Write-Host -noNewLine  -separator " ----> " $name,$source,$status
    Write-Host

    if ($count -match 10){
    pause
    $count=1
    }

    $count=$count+1
}
