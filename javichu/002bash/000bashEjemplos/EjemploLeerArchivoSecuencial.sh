#hace una lectura secuencial de un archivo de texto, lo lee y lo escribe linea por linea
#!/bin/bash
ct=0
while read linea;do
	let ct=ct+1
	echo $ct $linea
	echo "..."
done < /etc/group

##hace una lectura sencuencia de un archivo de texto, lo guarda linea por linea en una tabla
#!/bin/bash
echo "<table>" > archivo.html
while read linea;do
	echo "<tr><td>"$linea"</td></tr>" >> archivo.html
	grupo=echo $linea|cut -d: -f1 #guardar en grupo, cada linea, cortada por el "delimiter(d)" el primer campo "-f1 (antes del delimitador)"
	echo $grupo
done < /etc/group
echo "</table>">>archivo.html

##hace una lectura sencuencia de un archivo de texto, lo guarda linea por linea en una tabla separada por columnas
#!/bin/bash
clear
cabecera='<html><head><meta charset="UTF-8" /><title>Script guardar en html lista de usuarios</title><link rel="stylesheet" type="text/css" href="style.css"></head><body>'
pie='</body></html>'
echo $cabecera > archivo.html
echo "<table><tr><th>Usuarios</th></tr>" >> archivo.html

while read linea;do
	echo $linea
	usu=`echo $linea | cut -d: -f1`
	casa=`echo $linea | cut -d: -f5`
	echo $casa $usu
	cadena="<tr><td>"$usu"</td><td>"$casa"</td></tr>"
	echo $cadena >> archivo.html
done < /etc/passwd
echo "</table>" >> archivo.html
echo $pie >> archivo.html