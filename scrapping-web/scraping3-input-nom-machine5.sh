#!/bin/bash

# Función para descargar la página web y guardarla en un archivo temporal
function descargar_pagina_temporal {
  curl https://www.vulnhub.com/ > temporal.log 2>/dev/null
}

# Verificar si el archivo log.log existe
if [ -f log.log ]; then
  # Archivo log.log existe, proceder con la búsqueda
  # Extraer y mostrar las máquinas disponibles
  echo "Estas son las máquinas disponibles:"

  # Extrayendo las máquinas disponibles y almacenándolas en un array
  machines=($(cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/ /; s/\/" download="/ /' | awk '{print $3}' | tr -d '/' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq))

  # Mostrando las máquinas disponibles junto con sus números
  for ((i=0; i<${#machines[@]}; i++)); do
    echo "$i: ${machines[i]}"
  done

  # Solicitar al usuario que ingrese el número o el nombre de la máquina
  read -p "Ingresa el número o el nombre de la máquina que deseas: " input

  # Verificar si el valor ingresado es un número
  if [[ $input =~ ^[0-9]+$ ]]; then
    machine_number=$input
    if [ "$machine_number" -ge 0 ] && [ "$machine_number" -lt ${#machines[@]} ]; then
      machine_name="${machines[machine_number]}"
      echo "Seleccionaste la máquina '$machine_name'."
      # Buscar una coincidencia parcial del nombre de la máquina en el archivo log.log
      if grep -q "$machine_name" log.log; then
        echo "La máquina '$machine_name' existe en el archivo."
      else
        echo "La máquina '$machine_name' no existe en la lista."
      fi
    else
      echo "Número de máquina no válido."
    fi
  else
    machine_name=$input
    # Buscar una coincidencia parcial del nombre de la máquina en el archivo log.log
    if grep -q "$machine_name" log.log; then
      echo "La máquina '$machine_name' existe en el archivo."
    else
      echo "La máquina '$machine_name' no existe en la lista."
    fi
  fi
else
  # Archivo log.log no existe, descargar la página y crearlo
  descargar_pagina_temporal
  mv temporal.log log.log
  echo "Archivo log.log creado y poblado."
  echo "Por favor, ejecuta el script nuevamente para buscar máquinas."
fi

# Este script de Bash realiza las siguientes acciones:

#     Define una función llamada descargar_pagina_temporal que utiliza el comando curl para descargar la página web de VulnHub (https://www.vulnhub.com/) y guarda la descarga en un archivo temporal llamado temporal.log.

#     Verifica si el archivo log.log existe en el directorio actual utilizando la condición [ -f log.log ].

#     Si log.log existe, procede con la búsqueda y muestra las máquinas disponibles en la lista. Esto se hace extrayendo las máquinas disponibles del archivo log.log, procesando los datos y almacenándolos en un array llamado machines. Luego, muestra estas máquinas junto con un número asignado a cada una.

#     Solicita al usuario que ingrese el número o el nombre de la máquina que desea buscar.

#     Verifica si el valor ingresado es un número o un nombre de máquina. Si es un número, verifica si está en el rango válido y busca la máquina correspondiente en machines. Si es un nombre de máquina, busca una coincidencia parcial en el archivo log.log.

#     Informa al usuario si la máquina existe en la lista original en log.log o si no existe.

#     Si el archivo log.log no existe, se ejecuta la función descargar_pagina_temporal para descargar la página web en un archivo temporal temporal.log. Luego, se renombia temporal.log a log.log, creando así un archivo log.log poblado con datos.

#     Se muestra un mensaje indicando que el archivo log.log ha sido creado y poblado y se solicita al usuario que ejecute el script nuevamente para buscar máquinas.

# En resumen, el script permite al usuario buscar máquinas en la lista de VulnHub, descargando la lista si no existe previamente y luego verificando si la máquina especificada por el usuario está presente en la lista o no. Además, muestra las máquinas disponibles para su selección.