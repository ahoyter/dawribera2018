$var = 1

do {
    'Elige el formato para visualizar el resultado de la instruccion Get-Process (ver los procesos que se estan ejecutando en la Pc)'
    '1 -> Html'
    '2 -> Csv'
    '3 -> Json'
    '0 -> Salir'
    $var = Read-Host -Prompt 'Seleccion'

    switch($var) {
        1 {
        Get-Process | ConvertTo-Html -title "Lista de _Procesos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Procesos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeProcesos.html
        Get-Content .\listaDeProcesos.html
         }                   

        2 {
        Get-Process | ConvertTo-Csv >> listaDeProcesos.csv
        Get-Content .\listaDeProcesos.csv
        }

        3 {
        Get-Process | ConvertTo-Json >> listaDeProcesos.json
        Get-Content .\listaDeProcesos.json
        }

        0 {
        $var = 0
        }
    }
} while($var)
