#!/bin/bash
menuSel=1
discard=0

function menuFunc() {
  echo "::menu::";
  echo "1- usuarios";
  echo "2- grupos";
  echo "3- procesos";
  echo "4- pkts instalados";
  echo "0- salir";
  echo "seleccione una opcion:";  
}

function displayFunc() {
  case "$menuSel" in
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

while [ $menuSel -ne 0 ]; do
  menuFunc
  read menuSel
  clear
  
  displayFunc
  echo "presiona una tecla para continuar...";
  read discard
  clear
done
