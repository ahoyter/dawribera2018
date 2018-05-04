#pedimos la lista de Archivos
Get-Item .\css | ConvertTo-Html -title "Lista de _Archivos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Archivos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeArchivos.html
Get-Item .\css | ConvertTo-Csv >> listaDeArchivos.csv
Get-Item .\css | ConvertTo-Json >> listaDeArchivos.json