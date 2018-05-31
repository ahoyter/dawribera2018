#!/bin/bash
################
# made by OOQQ #
################

archivo="/var/www/html/index2.html"
seleccion=1
respuesta="s"

menuFunc() {
	clear
	printf "..::mostrar listados::..
-1- usuarios
-2- grupos
-3- procesos
-4- pkts instalados
-9- acerca de...
-0- salir

seleccione una opcion:\n"
read seleccion
}

displayFunc() {
	case $1 in
		1) cut -d: -f1 /etc/passwd
			;;
		2) cut -d: -f1 /etc/group
			;;
		3) ps -aux
			;;
		4) dpkg -l
			;;
		*) break
			;;
	esac
}

createFunc() {
	echo "<html>" > $archivo
	echo "<head>" >> $archivo
	echo "<title>Generado con el script de creacion de listados</title>" >> $archivo
	echo "<link rel="stylesheet" type="text/css" href="style.css">" >> $archivo
	echo "</head>" >> $archivo
	echo "<body>" >> $archivo
	echo "<h1>lista de VARIABLE</h1>" >> $archivo
	echo "<pre>" >> $archivo
	displayFunc $1
	echo "</pre>" >> $archivo
	echo "</body>" >> $archivo
	echo "</html>" >> $archivo
}

comprobarFunc() {
	cat $archivo
}

aboutFunc() {
	printf "este programa ha sido creado por OOQQ - 31/05/2018
presione ENTER para continuar..."
	read respuesta
}

while true; do #ENTRY POINT
	menuFunc
	if [ $seleccion -gt 4 ] && [ $seleccion -lt 9 ]; then
		continue
	elif [ $seleccion -eq 9 ]; then
		aboutFunc
		continue
	elif [ $seleccion -eq 0 ]; then
		printf "\nbye\n"
		break
	else
		displayFunc $seleccion

		printf "\ndesea guardar el archivo? (s/n)\n"
		read respuesta
		if [ "$respuesta" == "s" ]; then
			createFunc $seleccion
			if [ "$respuesta" == "s" ]; then
				printf "\ndesea comprobar el archivo? (s/n)\n"
				read respuesta
				if [ "$respuesta" == "s" ]; then
					comprobarFunc
				else
					continue
				fi
			else
				continue
			fi
		else
			continue
		fi

		printf "\npresione ENTER para continuar...\n"
		read respuesta
	fi
done
