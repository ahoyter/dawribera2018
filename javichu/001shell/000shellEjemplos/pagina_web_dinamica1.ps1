$parar=1
do
{
    get-process |convertto-html -as list -CssUri "materialize.css" -head '<meta http-equiv="refresh" content="3">' -Property  id, name, cpu >procesos.html

    start-sleep -Seconds 5

}while ( $parar -eq 1 )