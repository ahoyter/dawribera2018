#!/bin/bash
#####################
#
#
#####################
crearArchivo() {
	#
	#	if [-z $2 ];then
	#		order="user"
	#	else
	#		orden=$2
	#	fi
		echo $orden
		read parametro

		echo "<html>" > $archivo

		crearHead
		crearBody

		echo "</html>" >> $archivo
		echo "desea verificar que lo ha creado?"
		read respuesta
		if [ $respuesta = "s" ]; then
			comprobar
		fi
}

crearHead() {
	echo "<head>" >> $archivo
	echo "<title>Generado con el script de creacion de archivos</title>" >> $archivo
	echo "<link rel="stylesheet" type="text/css" href="style.css">" >> $archivo
	echo "</head>" >> $archivo
}

crearBody() {
	echo "<body>" >> $archivo
	echo "<pre>" >> $archivo
		ps -eo user, pid, cmd --sort $orden >> $archivo
	echo "</pre>" >> $archivo
	echo "</body>" >> $archivo
}

comprobar() {
	#verifica que se ha creado con exito el fichero
	cat $archivo
}

if [ -z $1 ]; then

	echo "Usage :$0 nombreArchivo.html [user|pid|cmd]"
	read parametro
else

	if [ -z $2 ]; then
		orden="user"
	else
		case $2 in
		user|pid|cmd)
			orden=$2
			;; #fin del case switch
		*) echo "error de parametro ordenacion"
			exit
			;;
		esac #fin del case
	fi #fin del if
	echo $orden
	read parametro

	fichero=$1
	if [ -e $archivo ];then
		echo "Archivo $archivo existe desea reescribirlo? s/n"
		read respuesta
		if [ $respuesta = "s" ]; then
			crearArchivo
		else
			echo "no lo quieres crear"
			exit
		fi
	else
		echo "no existe y lo creo"
		crearArchivo
	fi
fi
