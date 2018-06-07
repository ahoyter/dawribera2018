#pedimos la lista de Grupos
Get-LocalGroup | ConvertTo-Html -title "Lista de _Grupos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Grupos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeGrupos.html
Get-LocalGroup | ConvertTo-Csv >> listaDeGrupos.csv
Get-LocalGroup | ConvertTo-Json >> listaDeGrupos.json

#pedimos la lista de administradores
Get-LocalGroupMember "Administradores" | ConvertTo-Html -title "Lista de Usuarios en el grupo _Administradores_" -CssUri ".\css\style.css" -pre "<h1>Lista de Usuarios en el grupo _Administradores_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeUsuariosGrupoAdmin.html
Get-LocalGroupMember "Administradores" | ConvertTo-Csv >> listaDeUsuariosGrupoAdmin.csv
Get-LocalGroupMember "Administradores" | ConvertTo-Json >> listaDeUsuariosGrupoAdmin.json

#pedimos la lista de usuarios
Get-LocalGroupMember "Usuarios" | ConvertTo-Html -title "Lista de Usuarios en el grupo _Usuarios_" -CssUri ".\css\style.css" -pre "<h1>Lista de Usuarios en el grupo _Usuarios_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeUsuariosGrupoUsers.html
Get-LocalGroupMember "Usuarios" | ConvertTo-Csv >> listaDeUsuariosGrupoUsers.csv
Get-LocalGroupMember "Usuarios" | ConvertTo-Json >> listaDeUsuariosGrupoUsers.json

#pedimos la lista de Procesos
Get-Process | ConvertTo-Html -title "Lista de _Procesos_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Procesos_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeProcesos.html
Get-Process | ConvertTo-Csv >> listaDeProcesos.csv
Get-Process | ConvertTo-Json >> listaDeProcesos.json

#pedimos la lista de Servicios
Get-Service | ConvertTo-Html -title "Lista de _Servicios_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Servicios_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDeServicios.html
Get-Service | ConvertTo-Csv >> listaDeServicios.csv
Get-Service | ConvertTo-Json >> listaDeServicios.json

#pedimos la lista de Package
Get-Package | ConvertTo-Html -title "Lista de _Paquetes_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Paquetes_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDePaquetes.html
Get-Package | ConvertTo-Csv >> listaDePaquetes.csv
Get-Package | ConvertTo-Json >> listaDePaquetes.json

#pedimos la lista de Archivos
Get-Package | ConvertTo-Html -title "Lista de _Paquetes_" -CssUri ".\css\style.css" -pre "<h1>Lista de _Paquetes_</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> listaDePaquetes.html
Get-Package | ConvertTo-Csv >> listaDePaquetes.csv
Get-Package | ConvertTo-Json >> listaDePaquetes.json