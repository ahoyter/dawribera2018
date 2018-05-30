#pedimos la lista de Grupos
Get-LocalGroup | ConvertTo-Html -title "Lista de _Grupos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Grupos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeGrupos.html
Get-LocalGroup | ConvertTo-Csv >> listaDeGrupos.csv
Get-LocalGroup | ConvertTo-Json >> listaDeGrupos.json