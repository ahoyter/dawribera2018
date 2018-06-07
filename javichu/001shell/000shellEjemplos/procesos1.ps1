function Menu 
{ 
    
    
     Write-Host "================ MENU ================" 
      
write-host " 1-Por consumo de CPU
 2-POR CONSUMO DE MEMORIA
 3- POR ID
 4-SALIR"
}

$a = 0
$procesos = Get-Process

$i = 0
 Write-host "ID      NOMBRE"
 write-host "===    ========="

do
{
   
    $nombre = $procesos[$i].name
     $id = $procesos[$i].id
    
     Write-host "$id    $nombre"
   
    $i = $i+1
}until($i -eq $procesos.length)
read-host "Enter para continuar"
do{
menu
$a=Read-Host "Teclea una opcion:"
switch ($a){
1 {
  
       $consumo=read-host "Introduce valor inicial"
        $consumo2=read-host "Introduce valor final"
         get-process | where-object {$_.cpu -gt $consumo -and $_.cpu -lt $consumo2}
        
  }
2 {
    [int]$mb=0;
        $mb=read-host "Introduce valor inicial"
        $mb=$mb*1024*1024
        [int]$mb2=0;
        $mb2=read-host "Introduce valor final"
        $mb2=$mb2*1024*1024
        get-process | where-object {$_.WorkingSet -gt $mb} | where-object {$_.WorkingSet -lt $mb2}
   }
3  {
     
     $id2=read-host "Introduce valor inicial"
      $id3=read-host "Introduce valor final"
      get-process | where-object {$_.Id -gt $id2} | where-object {$_.Id -lt $id3}
   }        
}
}until($a -eq 4)
