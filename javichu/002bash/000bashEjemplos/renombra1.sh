#!/bin/sh
# renom: renombra múltiples ficheros de acuerdo con ciertas
# reglas
# escrito por Felix Hudson  
             
# primero comprueba los distintos 'modos' que tiene este
# programa
# si la primera ($1) condición coincide, se ejecuta esa parte
# del programa y acaba

# comprueba la condición de prefijo
if [ $1 = p ]; then

# ahora nos libramos de la variable de modo ($1) y ponemos $2
# de prefijo
prefijo=$2 ; shift ; shift

# una rápida comprobación para ver si se especificó algún
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
             # el resto es casi idéntico a la parte anterior
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
             
             # comprueba si es una sustitución
             if [ $1 = r ]; then
             
               shift
             
             # he incluído esto para no dañar ningún fichero si el
             # usuario no especifica que se haga nada
             # tan sólo una medida de seguridad             
               if [ $# -lt 3 ] ; then
                 echo "uso: renom r [expresión] [sustituto] ficheros... "
                 exit 0
               fi
             
             # elimina el resto de información
               VIEJO=$1 ; NUEVO=$2 ; shift ; shift
             
             # este bucle for itera a lo largo de todos los ficheros que
             # le hemos especificado al programa
             # renombra cada fichero utilizando el programa 'sed'
             # es un sencillo programa desde la línea de comandos que
             # analiza la entrada estándar y sustituye una expresión por
             # una cadena dada
             # aquí le pasamos el nombre del fichero (como entrada
             # estándar)
               for fichero in $*
               do
                 nuevo=`echo ${fichero} | sed s/${VIEJO}/${NUEVO}/g`
                 mv ${fichero} $nuevo
               done
             exit 0
             fi
             
             # si se llega a esta parte es que no se le pasó nada
             # apropiado al programa, por lo que le decimos al usuario
             # cómo hacerlo
             echo "uso:"
             echo " renom p [prefijo] ficheros.."
             echo " renom s [sufijo] ficheros.."
             echo " renom r [expresión] [sustituto] ficheros.."
             exit 0
             
             # hecho!