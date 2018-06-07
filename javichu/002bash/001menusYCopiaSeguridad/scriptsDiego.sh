clear
PPATH="/var/www/html"
function getFullPath() {
	NOMBRE="$1.html"
	FULLPATH="$PPATH/$NOMBRE"
}
function doHTML() {
	getFullPath $1
	echo "<html><head><meta http-equiv='refresh' content='2'><title>$opcion</title></head><body><h1>" > "${FULLPATH}"
	echo $1 >> "${FULLPATH}"
	echo "</h1><pre>" >> "${FULLPATH}"
	$1 >> "${FULLPATH}"
	echo "</pre><a href='...'>Volver al index</a></body></html>" >> "${FULLPATH}"
	echo "Guardado en $NOMBRE"
}

function showOptions() {
	echo -e "\e[32m1)\e[93m Procesos"
	echo -e "\e[32m1)\e[93m Usuarios"
	echo -e "\e[32m1)\e[93m Grupos"
	echo -e "\e[32m1)\e[93m Paquetes Instalados"
	echo -e "\e[32m1)\e[93m Copia Seguridad"
	echo -e "\e[32m1)\e[93m Usuarios Online"
	echo -e "\e[32m1)\e[93m Salir"
}

function doMenu() {
	echo -e "\e[42m\e[1mMenu Principal\e[45m"
	echo -e	"\e[97m____________________________________________"
	showOptions
	echo -e "\e[95mEscoja Opcion\e[97m"
	read seleccion
	echo -e "______________________\e[96m"
	case $seleccion in
		1) doHTML "procesos"
			procesos;;
		2) doHTML "usuarios"
			usuarios;;
		3) doHTML "grupos"
			grupos;;
		4) doHTML "paquetes"
			paquetes;;
		5) doHTML "copia_seguridad"
##			copia_seguridad;;
		6) doHTML "usuarios_online"
			usuarios_online;;
		7) doexit;;
		*) echo "No reconozco eso. Intentalo de nuevo";;
	esac
}

function procesos(){ ps -aux }
function usuarios(){ cat /etc/passwd | cut -d ":" -f1 }
function grupos(){ cat /etc/group | cut -d ":" -f1 }
function paquetes() { dpkg -l }
function copia_seguridad() {
	INPUT="/var/www/html"
	OUTPUT="$HOME/backup-$(date +%Y%m%d).tgz"
	tar czf $OUTPUT $INPUT
	ls $HOME
}
function usuarios_online() { who -H }
function doexit() {	echo -e "\e[96m" exit }

while true; do
	doMenu;
done