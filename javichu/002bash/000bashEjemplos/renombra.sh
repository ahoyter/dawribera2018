#!/bin/bash
# renombra.sh
# renombrador de ficheros básico

criterio=$1
expresion=$2
sustituto=$3
     
for i in $( ls *$criterio* ); 
  do
    orig=$i
    dest=$(echo $i | sed -e "s/$expresion/$sustituto/")
    mv $orig $dest
  done