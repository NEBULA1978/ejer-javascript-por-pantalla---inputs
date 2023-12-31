#!/bin/bash

# Author: Marcelo Vázquez (aka S4vitar)
# Modifications to PyBlock (pip3 install pybitblock)

# Colores
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
  tput cnorm
  exit 1
}

function helpPanel() {
  echo -e "\n${redColour}[!] Uso: ./btcAnalyzer${endColour}"
  for i in $(seq 1 80); do echo -ne "${redColour}-"; done
  echo -ne "${endColour}"
  echo -e "\n\n\t${grayColour}[-e]${endColour}${yellowColour} Modo exploración${endColour}"
  echo -e "\t\t${purpleColour}unconfirmed_transactions${endColour}${yellowColour}:\t Listar transacciones no confirmadas${endColour}"
  echo -e "\t\t${purpleColour}inspect${endColour}${yellowColour}:\t\t\t Inspeccionar un hash${endColour}"
  echo -e "\t\t${purpleColour}address${endColour}${yellowColour}:\t\t\t Inspeccionar una dirección${endColour}"
  echo -e "\n\t${grayColour}[-h]${endColour}${yellowColour} Mostrar este panel de ayuda${endColour}\n"

  tput cnorm
  exit 1
}
function list_unconfirmed_transactions() {
  # Verificar si el archivo htmlblockchain.log existe y no está vacío
  if [ ! -s htmlblockchain.log ]; then
    # Si no existe o está vacío, descargar la página web
    echo "Descargando la página de transacciones no confirmadas..."
    curl -L "$unconfirmed_transactions" | html2text > htmlblockchain.log
    echo "Descarga completada."
  fi

  # Extraer y mostrar los números de hash
  hashes="$(grep -F "Hash" -A 1 htmlblockchain.log | grep -v "\--" | sed 's/Hash_//' | grep -oE "[0-9a-fA-F]{64}")"

  for hash in $hashes; do
    echo "$hash"
  done
  tput cnorm
}



# Script principal
parameter_counter=0
while getopts "e:h:" arg; do
  case $arg in
  e)
    exploration_mode="$OPTARG"
    let parameter_counter+=1
    ;;
  h) helpPanel ;;
  esac
done

tput civis

if [ $parameter_counter -eq 0 ]; then
  helpPanel
else
  if [ "$(echo "$exploration_mode")" == "unconfirmed_transactions" ]; then
    list_unconfirmed_transactions
  fi
fi

# Agregar más modos de exploración y funciones según sea necesario
