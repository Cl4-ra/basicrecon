#!/bin/bash

## SCRIPT PARA HACER RECON BASICO Y ENUMERACION INICIAL

##RECON CON NMAP BASICO
echo -e "\e[1;33m**** Introduce la IP del objetivo para lanzar escaneo nmap : **** \e[0m"
read ip
nmap -sV $ip 
echo "     "

##SCRIPT DE VULN CON NMAP
echo -e "\e[1;33m**** Quieres pasar el script de vulnerabilidades? Escribe SI o NO ****\e[0m"
read vuln
if [ $vuln = SI ];
then 
	echo -e "\e[32mPerfecto, me pongo a ello\e[0m"
	echo -e "\e[5;32mEscaneando... Paciencia, que tardo un poquet... El contenido se guardara en un archivo txt \e[0m"
	nmap --script vuln $ip >> nmap-$ip.txt  ##con esto lanzamos un nmap con script vuln basico
elif [ $vuln = NO ];
then
	echo -e "\e[32mOkai, otra vez sera\e[0m"
fi



echo "      "
echo -e "\e[32mSe recomienda tambien pasar un escaneo mas completo, como openvas o nessus, que te sacaran mas cosillas :)\e[0m"

echo "      "

##ESCANEO CON NIKTO SI HAY SERVICIO WEB, esto esta todavia sin conseguir del todo
echo -e "\e[1;33m**** Si quieres lanzar nikto a servicio web que tenga la maquina introduce SI, sino NO ****\e[0m"
read nikto

if [ $nikto = SI ];
then 
	echo -e "\e[1;33mIndica el puerto donde tiene ese servicio montado\e[0m"
	read pweb
	echo -e "\e[5;32mPaciencia que tardo un ratin...\e[0m"
	nikto -host $ip -p $pweb >> nikto-$ip.txt ##con esto lanzamos nikto
	echo -e "\e[32mse guardo el contenido en un archivo txt\e[0m"
elif [ $nikto = NO ];
then
	echo -e "\e[32mOkai, otra vez sera\e[0m"
fi


#### colores utilizados: 
## para las preguntas amarillo en negrita (1;33)
## para las respuestas verde normal (32)


