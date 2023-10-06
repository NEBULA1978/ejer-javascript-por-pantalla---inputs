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

  # Utilizar mapfile to read the output into an array
  # Utilizar mapfile para leer la salida en un arreglo
# El comando entre paréntesis '<(...)' se utiliza para crear un proceso en segundo plano y obtener su salida
# Luego, mapfile se utiliza para leer esa salida y almacenarla en el arreglo 'machines'
# -t se usa para quitar los caracteres de nueva línea de cada elemento del arreglo
mapfile -t machines < <(
  grep 'href="/entry/' log.log |            # Filtrar líneas que contienen 'href="/entry/'
  tr -d '#' |                              # Eliminar el carácter '#'
  sed 's/entry/ /; s/\/" download="/ /' |  # Reemplazar 'entry' por espacio y '/" download="' por espacio
  awk '{print $3}' |                       # Tomar el tercer campo (nombre de la máquina)
  tr -d '/' |                             # Eliminar barras '/'
  sed 's/"/ /' |                           # Reemplazar comillas dobles por espacio
  tr -d '>' |                             # Eliminar el carácter '>'
  tr -d ' ' |                             # Eliminar espacios en blanco
  uniq                                    # Eliminar duplicados
)

  # Mostrando las máquinas disponibles junto con sus números
  for ((i=0; i<${#machines[@]}; i++)); do
    echo "$i: ${machines[i]}"
  done

  # Solicitar al usuario que ingrese el número o el nombre de la máquina
  read -r -p "Ingresa el número o el nombre de la máquina que deseas: " input

  # Verificar si el valor ingresado es un número
  if [[ $input =~ ^[0-9]+$ ]]; then
    machine_number=$input
    # Verificar si el número ingresado está en el rango válido
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
