#!/bin/bash
################
# made by OOQQ #
################

archivo="/var/www/html/index2.html"
seleccion=1
respuesta="s"

menuFunc() {
	clear
	echo "::mostrar listados::";
	echo "1- usuarios";
	echo "2- grupos";
	echo "3- procesos";
	echo "4- pkts instalados";
	echo "0- salir";
	echo "";
	echo "seleccione una opcion:";
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

while true; do #ENTRY POINT
	menuFunc
	if [ $seleccion -gt 4 ] && [ $seleccion -lt 10 ]; then
		continue
	elif [ $seleccion -eq 0 ]; then
		break
	else
		displayFunc $seleccion

		echo "";
		echo "desea guardar el archivo? s/n";
		read respuesta
		if [ "$respuesta" == "s" ]; then
			createFunc $seleccion
			if [ "$respuesta" == "s" ]; then
				echo "";
				echo "desea comprobar el archivo? s/n";
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

		echo "";
		echo "presione una tecla para continuar...";
		read respuesta
	fi
done
