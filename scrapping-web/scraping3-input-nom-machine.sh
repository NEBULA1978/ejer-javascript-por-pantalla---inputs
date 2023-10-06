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

# Mostrando las máquinas disponibles
for ((i=0; i<${#machines[@]}; i++)); do
  echo "$i: ${machines[i]}"
done

# Solicitar al usuario que ingrese el nombre de la máquina
read -p "Ingresa el nombre de la máquina que deseas: " machine_name

# Verificar si el nombre ingresado está en la lista de máquinas
found=false
for machine in "${machines[@]}"; do
  if [ "$machine" == "$machine_name" ]; then
    found=true
    break
  fi
done

# Mostrar el resultado según si la máquina se encontró o no
if $found; then
  echo "La máquina '$machine_name' está disponible."
else
  echo "La máquina '$machine_name' no se encuentra en la lista de máquinas disponibles."
fi

# Eliminar el archivo log.log
rm log.log
