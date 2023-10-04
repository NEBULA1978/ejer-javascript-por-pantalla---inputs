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

# Funciones

trap ctrl_c INT

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
    curl -L "$unconfirmed_transactions" | html2text >htmlblockchain.log
    echo "Descarga completada."
  fi

  # Extraer y mostrar solo los números de hash
  hashes="$(grep -F "Hash" -A 1 htmlblockchain.log | grep -v "\--" | sed 's/Hash_//' | grep -o '[0-9a-f]\{4\}-[0-9a-f]\{4\}')"

  # echo "$hashes"
  echo "Hash_Cantidad_Bitcoin_Tiempo" > ut.table

	for hash in $hashes; do
		echo "${hash}_$(cat ut.tmp | grep "$hash" -A 6 | tail -n 1)_$(cat ut.tmp | grep "$hash" -A 4 | tail -n 1)_$(cat ut.tmp | grep "$hash" -A 2 | tail -n 1)" >> ut.table
	done
  cat ut.table
  sleep 100

  tput cnorm
}

function printTable() {

  local -r delimiter="${1}"
  local -r data="$(removeEmptyLines "${2}")"

  if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]; then
    local -r numberOfLines="$(wc -l <<<"${data}")"

    if [[ "${numberOfLines}" -gt '0' ]]; then
      local table=''
      local i=1

      for ((i = 1; i <= "${numberOfLines}"; i = i + 1)); do
        local line=''
        line="$(sed "${i}q;d" <<<"${data}")"

        local numberOfColumns='0'
        numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<<"${line}")"

        if [[ "${i}" -eq '1' ]]; then
          table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
        fi

        table="${table}\n"

        local j=1

        for ((j = 1; j <= "${numberOfColumns}"; j = j + 1)); do
          table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<<"${line}")")"
        done

        table="${table}#|\n"

        if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]; then
          table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
        fi
      done

      if [[ "$(isEmptyString "${table}")" = 'false' ]]; then
        echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
      fi
    fi
  fi
}

# FIN Funciones

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
