#!/bin/sh
# renom: renombra m�ltiples ficheros de acuerdo con ciertas
# reglas
# escrito por Felix Hudson  
             
# primero comprueba los distintos 'modos' que tiene este
# programa
# si la primera ($1) condici�n coincide, se ejecuta esa parte
# del programa y acaba

# comprueba la condici�n de prefijo
if [ $1 = p ]; then

# ahora nos libramos de la variable de modo ($1) y ponemos $2
# de prefijo
prefijo=$2 ; shift ; shift

# una r�pida comprobaci�n para ver si se especific� alg�n
# fichero
# si no, hay cosas mejores que hacer que renombrar ficheros
# inexistentes!!
if [$1 = ]; then
  echo "no se especificaron ficheros"
  exit 0
fi

# este bucle for itera a lo largo de todos los ficheros que
# le hemos especificado al programa
# renombra cada uno de ellos
for fichero in $*
 do
 mv ${fichero} $prefijo$fichero
done

# ahora salimos del programa
exit 0
             fi
             
             # comprueba si es un renombramiento con sufijo
             # el resto es casi id�ntico a la parte anterior
             # lea los comentarios anteriores
             if [ $1 = s ]; then
               sufijo=$2 ; shift ; shift
             
                if [$1 = ]; then
                 echo "no se especificaron ficheros"
                exit 0
                fi
             
              for fichero in $*
               do
                mv ${fichero} $fichero$sufijo
              done
             
              exit 0
             fi
             
             # comprueba si es una sustituci�n
             if [ $1 = r ]; then
             
               shift
             
             # he inclu�do esto para no da�ar ning�n fichero si el
             # usuario no especifica que se haga nada
             # tan s�lo una medida de seguridad             
               if [ $# -lt 3 ] ; then
                 echo "uso: renom r [expresi�n] [sustituto] ficheros... "
                 exit 0
               fi
             
             # elimina el resto de informaci�n
               VIEJO=$1 ; NUEVO=$2 ; shift ; shift
             
             # este bucle for itera a lo largo de todos los ficheros que
             # le hemos especificado al programa
             # renombra cada fichero utilizando el programa 'sed'
             # es un sencillo programa desde la l�nea de comandos que
             # analiza la entrada est�ndar y sustituye una expresi�n por
             # una cadena dada
             # aqu� le pasamos el nombre del fichero (como entrada
             # est�ndar)
               for fichero in $*
               do
                 nuevo=`echo ${fichero} | sed s/${VIEJO}/${NUEVO}/g`
                 mv ${fichero} $nuevo
               done
             exit 0
             fi
             
             # si se llega a esta parte es que no se le pas� nada
             # apropiado al programa, por lo que le decimos al usuario
             # c�mo hacerlo
             echo "uso:"
             echo " renom p [prefijo] ficheros.."
             echo " renom s [sufijo] ficheros.."
             echo " renom r [expresi�n] [sustituto] ficheros.."
             exit 0
             
             # hecho!