#pedimos la lista de Package
Get-Package | ConvertTo-Html -title "Lista de _Paquetes_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Paquetes_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDePaquetes.html
Get-Package | ConvertTo-Csv >> listaDePaquetes.csv
Get-Package | ConvertTo-Json >> listaDePaquetes.json