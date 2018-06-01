#!\bin\bash -x
#-x == modo debugger

rutaOrigen=/var/www/html
rutaDestino=$HOME/backup-$(date +%Y%M%d).tgz

tar czf $of $if

menuFunc() {
	printf "desea guardar una copia de seguridad de los archivos creados? s\n"
}
