#pedimos la lista de Servicios
Get-Service | ConvertTo-Html -title "Lista de _Servicios_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Servicios_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeServicios.html
Get-Service | ConvertTo-Csv >> listaDeServicios.csv
Get-Service | ConvertTo-Json >> listaDeServicios.json