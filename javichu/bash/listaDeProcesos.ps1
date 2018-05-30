#pedimos la lista de Procesos
Get-Process | ConvertTo-Html -title "Lista de _Procesos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Procesos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeProcesos.html
Get-Process | ConvertTo-Csv >> listaDeProcesos.csv
Get-Process | ConvertTo-Json >> listaDeProcesos.json