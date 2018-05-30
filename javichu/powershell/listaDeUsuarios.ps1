#pedimos la lista de usuarios
Get-LocalGroupMember "Usuarios" | ConvertTo-Html -title "Lista de Usuarios en el grupo _Usuarios_" -CssUri ".\css\style.css" -pre "<h1>Lista de Usuarios en el grupo _Usuarios_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeUsuarios.html
Get-LocalGroupMember "Usuarios" | ConvertTo-Csv >> listaDeUsuarios.csv
Get-LocalGroupMember "Usuarios" | ConvertTo-Json >> listaDeUsuarios.json