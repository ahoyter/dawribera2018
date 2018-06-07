#pedimos la lista de administradores
Get-LocalGroupMember "Administradores" | ConvertTo-Html -title "Lista de Usuarios en el grupo _Administradores_" -CssUri ".\css\style.css" -pre "<h1>Lista de Usuarios en el grupo _Administradores_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeAdmins.html
Get-LocalGroupMember "Administradores" | ConvertTo-Csv >> listaDeAdmins.csv
Get-LocalGroupMember "Administradores" | ConvertTo-Json >> listaDeAdmins.json
