######################################################
# Este ejemplo trabaja con distintos tipos de array
# Y array asociativas.
#
######################################################


$o="pc1","pc2","pc3"
$p="profesor"
$c="passwd"
foreach ($ord in $o)
{
    write-host($ord,$p,$c)
}

# ejemplo con diccionario simple

$claves=@{pc1="192.168.12.3";"pc2"="192.168.11.2"}
foreach ($equipo in $claves)
{ 
      
    $equipo.Keys
    $equipo.Item
    
} 

foreach ($equipo in $claves.getEnumerator())
{ 
    write-host("equipos")
    write-host "$($equipo.Name):$($equipo.Value)"
   
    write-host("ip: ",$($equipo.Value))
    
}  

#ejemplo con dicionario de diccionarios-
 
$clave=[ordered]@{pc1=@{"alumno"="1234"};"pc2"=@{"profe"="12f3"}}
foreach ($equipo in $clave.getEnumerator())
{ 
    write-host("`n Equipos")
    write-host "$($equipo.Name):$($equipo.Value)"
   
   # write-host("ip: ",$($equipo.Value))
    
    foreach ($e in $($equipo.Value).getEnumerator())
    {
        write-host("`n datos del equipo")
        
        $e
        $u=$e.Name
        $p=$e.value
        write-host("usuario: ",$u )
        write-host("passwd: ",$p )
        
    
    }
    
}   
