#!/bin/bash

# Author: Marcelo Vázquez (aka S4vitar)
# Modifications to PyBlock (pip3 install pybitblock)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Variables globales
unconfirmed_transactions="https://www.blockchain.com/es/btc/unconfirmed-transactions"
inspect_transaction_url="https://www.blockchain.com/es/btc/tx/"
inspect_address_url="https://www.blockchain.com/es/btc/address/"

trap ctrl_c INT

# Funciones
function ctrl_c() {
  echo -e "\n${redColour}[!] Saliendo...\n${endColour}"

  # rm ut.t* money* total_entrada_salida.tmp entradas.tmp salidas.tmp bitcoin_to_dollars 2>/dev/null
  tput cnorm
  exit 1
}

function helpPanel(){
	echo -e "\n${redColour}[!] Uso: ./btcAnalyzer${endColour}"
	for i in $(seq 1 80); do echo -ne "${redColour}-"; done; echo -ne "${endColour}"
	echo -e "\n\n\t${grayColour}[-e]${endColour}${yellowColour} Modo exploración${endColour}"
	echo -e "\t\t${purpleColour}unconfirmed_transactions${endColour}${yellowColour}:\t Listar transacciones no confirmadas${endColour}"
	echo -e "\t\t${purpleColour}inspect${endColour}${yellowColour}:\t\t\t Inspeccionar un hash${endColour}"
	echo -e "\t\t${purpleColour}address${endColour}${yellowColour}:\t\t\t Inspeccionar una dirección${endColour}"
	# echo -e "\n\t${grayColour}[-n]${endColour}${yellowColour} Limitar el número de resultados${endColour}${blueColour} (Ejemplo: -n 10)${endColour}"
	# echo -e "\n\t${grayColour}[-i]${endColour}${yellowColour} Proporcionar el hash de transacción${endColour}${blueColour} (Ejemplo: -i 000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f)${endColour}"
	# echo -e "\n\t${grayColour}[-a]${endColour}${yellowColour} Proporcionar la dirección de transacción${endColour}${blueColour} (Ejemplo: -a 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa)${endColour}"
	# echo -e "\n\t${grayColour}[-h]${endColour}${yellowColour} Mostrar este panel de ayuda${endColour}\n"

	tput cnorm; exit 1
}


# Funciones



parameter_counter=0;while getopts "e:h:" arg; do
	case $arg in
		e) exploration_mode=$OPTARG; let parameter_counter+=1;;
		# n) number_output=$OPTARG; let parameter_counter+=1;;
		# i) inspect_transaction=$OPTARG; let parameter_counter+=1;;
		# a) inspect_address=$OPTARG; let parameter_counter+=1;;
		h) helpPanel;;
	esac
done

tput civis

if [ $parameter_counter -eq 0 ]; then
	helpPanel
else
  echo "Hola"
fi

# operaciones sumar numeros en bash para hashes:
# echo $((2+5))
# echo "2+5" | bc

# Voy minuto 23:43