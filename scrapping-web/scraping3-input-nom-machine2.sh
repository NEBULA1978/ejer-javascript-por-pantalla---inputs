#!/bin/bash

# Descargar la página web y guardarla en un archivo
curl https://www.vulnhub.com/ > log.log 2>/dev/null

# Verificar si la descarga fue exitosa
if [ $? -ne 0 ]; then
  echo "Error: No se pudo descargar la página web."
  exit 1
fi

# Extraer y mostrar las máquinas disponibles
echo "Estas son las máquinas disponibles:"

# Extrayendo las máquinas disponibles y almacenándolas en un array
machines=($(cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/ /; s/\/" download="/ /' | awk '{print $3}' | tr -d '/' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq))

# Mostrando las máquinas disponibles junto con sus números
for ((i=0; i<${#machines[@]}; i++)); do
  echo "$i: ${machines[i]}"
done

# Solicitar al usuario que ingrese el número de la máquina
read -p "Ingresa el número de la máquina que deseas: " machine_number

# Verificar si el número ingresado es válido
if [ "$machine_number" -ge 0 ] && [ "$machine_number" -lt ${#machines[@]} ]; then
  machine_name="${machines[machine_number]}"
  echo "Seleccionaste la máquina '$machine_name'."

  # Buscar una coincidencia parcial del nombre de la máquina en el archivo log.log
  if grep -q "$machine_name" log.log; then
    echo "La máquina '$machine_name' existe en el archivo."
  else
    echo "La máquina '$machine_name' no existe en el archivo."
  fi
else
  echo "Número de máquina no válido."
fi

# Eliminar el archivo log.log
rm log.log
