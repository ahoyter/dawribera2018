$equipos = [ordered]@{PC4751 = @{"alumno" = "valladolid"};
                      PC4771 = @{"skills" = "skills"};
                      PC4855 = @{"skills" = "skills"};
                      PC4856 = @{"skills" = "skills"};
                      PC4857 = @{"skills" = "skills"};
                      PC4860 = @{"alumno" = 123456};
                      PC5047 = @{"Alumno" = "Valladolid2018"};
                    }

Clear-Host #limpia la pantalla
Write-Host "Por favor elige un PC para conectarte a el:"

foreach ($equipo in $equipos.GetEnumerator()) { #imprime todos los nombres de los pcs
    foreach ($claveValor in $($equipo.Value).GetEnumerator()) { #hace accesibles los pares clave-valor de cada valor
        Write-Host ("`n datos del equipo") #´n caracter de escape
        Write-Host "Nombre del equipo : $($equipo.Name)"
        Write-Host ("Usuario: ", $($claveValor.Name)
    }
}

$claveConexion=Read-Host("Introduce un pc") #guardamos el pc al que queremos conectar
$equipo-$equipos.$claveConexion #guardamos en equipo los datos del pc al que queremos conectar
$passwd=$equipo.values ConvertTo-SecureString -AsPlainText -Force #guardamos la contraseña y la encriptamos
$user=$equipo.keys #guardamos el usuario
$cred = new-object -TypeName System.Management.Automation.PSCredential -ArgumentList ($user,$passwd) #guardamos en cred el usuario y la pass

Enable-PSRemoting -force
winrm s winrm/config/client '@{TrustedHosts="*"}'

Clear-Host #limpia la pantalla

do {
    "Elige la lista de cosas que quieres mostrar del equipo $($equipo.Name))"
    '1 -> Lista de administadores'
    '2 -> Lista de usuarios'
    '3 -> Lista de grupos'
    '4 -> Lista de procesos'
    '5 -> Lista de servicios'
    '6 -> Lista de paquetes'
    '0 -> Salir'
    $listaElegidaNum = Read-Host -Prompt 'Seleccion'
    switch($var) {
        1 {$opcionListaElegida = Get-LocalGroupMember "Administradores"}
        2 {$opcionListaElegida = Get-LocalGroupMember "Usuarios"}
        3 {$opcionListaElegida = Get-LocalGroup "Administradores"}
        4 {$opcionListaElegida = Get-Process}
        5 {$opcionListaElegida = Get-Service}
        6 {$opcionListaElegida = Get-Package}
        0 {$var = 0}
    }
    
    "Elige el formato para visualizar el resultado de la instruccion $($opcionListaElegida) en $($equipo.Name))"
    '1 -> Html'
    '2 -> Csv'
    '3 -> Json'

    $var = Read-Host -Prompt 'Seleccion'
    switch($var) {
        1 {
        Get-Process | ConvertTo-Html -title "Lista" -CssUri ".\css\style.css" -pre "<h1>Lista</h1>" -post "<footer><small>generado el dia 27 de Abril de 2018</small></footer>" >> lista.html
        Get-Content .\lista.html
        Pause #Presiona una tecla para continuar...
        }

        2 {
        Get-Process | ConvertTo-Csv >> lista.csv
        Get-Content .\lista.csv
        Pause #Presiona una tecla para continuar...
        }

        3 {
        Get-Process | ConvertTo-Json >> lista.json
        Get-Content .\lista.json
        Pause #Presiona una tecla para continuar...
        }
    }
} while($var)
