#!/bin/bash
clear
##Comprobar si eres el root.##
if [ 'id -u' -ne O ]
	then
		echo "No eres root, no puedes pasar"
		exit 1
fi
##Comprobar si el archivo existe##
if [ -f /home/usuario/usuarios.txt ]
	then
	echo "Obteniendo usuarios del archivo"
	else
		echo "El archivo no existe"
		exit 1
fi
usuarios='cat /home/usuarios/usuarios.txt | tr " " _'
for i in $usuarios
do
login='echo $i|cut -d: -f2' #nombre de usuario
campo1='echo $i|cut -d: -f3' #nombre
campo2='echo $i|cut -d: -f4' #apellidos
campo3='echo $i|cut -d: -f5' #email
campos=echo "$comentario1,$comentario2,$comentario3" #pasamos todas las variables de antes a una sola (?)
contra=echo $i|cut -d: -f6 #contraseña
useradd -m -s /bin/bash -c $campos $login #le pasamos al comando useradd todos los parametros que necesita a traves de las variables anteriores
echo "$login:$contra"|chpasswd --md5 #establecemos la contraseña
done

