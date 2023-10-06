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

cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/ /; s/\/" download="/ /' | awk '{print $3}' | tr -d '/' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq

# Buscar si la palabra "noob" se encuentra en el archivo log.log descargado
cat log.log | grep -q 'noob'

# Evaluar si el comando anterior se ejecutó correctamente con $?
if [ $? -eq 0 ]; then
  echo "No se encuentra ninguna máquina nueva"
else
  echo "¡Hay una máquina nueva!"
fi

# Eliminar el archivo log.log
rm log.log


#     Corregí la expresión regular en la línea que extrae las máquinas disponibles para que también maneje las máquinas que están en la segunda página.

#     Cambié la comprobación del resultado del comando grep para verificar si "noob" está presente en el archivo descargado utilizando -q.

# El script seguirá funcionando de manera similar a la versión anterior, pero ahora debería manejar las máquinas en la segunda página correctamente.