############################################################
# Script que visualiza inicialmente todos los tipos de eventos log
# Posteriormente me ira preguntando si quiero visualizar esos log
# en caso afirmativo por defecto visualiza los de tipo informtion
#
#############################################################
function visualizar(){


    $entryType=read-host "dame el tipo de entrytype"
    if ($entryType -eq ""){$entryType = "information"}
    #el parametro -ea erroraction stop envia un mensaje de error pero sigue la ejecucion
    Get-EventLog -log $logtype -EntryType $entryType -ea stop
    
    $borrar=read-host "Desea borrar este log s/n"
    if ($borrar -eq "s"){clear-EventLog -logname $logtype -Confirm}

}
do{
$logs=get-eventlog -list
write-host "estos son todos los log registrados"
get-eventlog -List
$pause =read-host "pulse una tecla para continuar"
foreach ($tipo in $logs){

    Write-Host $tipo.log
    write-host "logs de tipo" $tipo.log
    $logtype=$tipo.log
   $sino= read-host "desea visualizar los eventos  de "$tipo.log
   if ($sino -eq "s"){
    visualizar
   }
     #get-eventlog -log $tipo.log -EntryType "error" 
     if ($tipo.log -eq "System") {
     $final = get-date
     $inicio=$final.addDays(-2)

     get-eventlog  -log $tipo.log -EntryType "information" -after $inicio -before $final|convertto-html >> eventlog.html
     }
     $pause =read-host "Pulse una tecla para continuar"


}
$continuar = read-host "continuar el proceso.."
}while ($continuar -eq "n")