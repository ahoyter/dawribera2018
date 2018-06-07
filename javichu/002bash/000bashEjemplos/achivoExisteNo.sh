#!/bin/bash
FILE=~/.basrc
if [ -f $FILE ]; then
	echo el fichero $FILE existe
else
	echo fichero no encontrado
fi
if [ 'test -f $FILE']