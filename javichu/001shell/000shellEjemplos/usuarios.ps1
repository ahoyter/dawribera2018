if($args.Count -ne 2){
write-host "uso: debe introducir Usuario/grupo y nombre de fichero a convertir"
exit
}
elseif ($args[0] -eq "usuario" -or $args[0] -eq "grupos")
{
get-localgroup|convertto-html > $args[1]
}
