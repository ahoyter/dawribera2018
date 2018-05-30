#!/bin/bash
################
# made by OOQQ #
################

archivo="listado.html"
respuesta=1

function menuFunc() {
	clear
	echo "::mostrar listados::";
	echo "1- usuarios";
	echo "2- grupos";
	echo "3- procesos";
	echo "4- pkts instalados";
	echo "0- salir";
	echo "seleccione una opcion:";
	read $respuesta
}

function displayFunc() {
	case "$1" in
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

function createFunc() {
	echo "<html>" > $archivo
	echo "<head>" >> $archivo
	echo "<title>Generado con el script de creacion de listados</title>" >> $archivo
	echo "<link rel="stylesheet" type="text/css" href="style.css">" >> $archivo
	echo "</head>" >> $archivo
	echo "<body>" >> $archivo
	echo "<pre>" >> $archivo
	displayFunc $1
	echo "</pre>" >> $archivo
	echo "</body>" >> $archivo
	echo "</html>" >> $archivo
}

function comprobar() {
	cat $archivo
}

while true; do #ENTRY POINT
	menuFunc
	if [ $respuesta -eq 5|6|7|8|9 ]; then
		continue
	elif [ $respuesta -eq 0 ]; then
		break
	else
		displayFunc $menuSel

		echo "";
		echo "desea guardar el archivo? s/n";
		read respuesta
		if [ $respuesta = "s" ]; then
			createFunc $menuSel
		fi

		echo "";
		echo "desea comprobar el archivo? s/n";
		read respuesta
		if [ $respuesta = "s" ]; then
			comprobar
		fi

		echo "";
		echo "presione una tecla para continuar...";
	fi
done
