#!/bin/bash

# Descargar la página web con wget
wget -q -O log.log https://www.vulnhub.com/

echo "Estas son las máquinas disponibles: "

# Extraer los nombres de las máquinas disponibles
cat log.log | grep 'href="/entry/' | sed -n 's/.*href="\/entry\/\([^\/"]*\).*/\1/p' | uniq

# Buscar si hay una nueva máquina añadida
# Debes reemplazar 'nueva_máquina' con el nombre exacto de la máquina que deseas buscar. Por ejemplo, si quieres buscar una máquina llamada "mi_maquina", la línea se vería así:
# if grep -q 'mi_maquina' log.log; then

if grep -q 'nueva_máquina' log.log; then
  echo "¡Hay una nueva máquina disponible!"
else
  echo "No se encontró ninguna máquina nueva."
fi

# Eliminar el archivo temporal
rm log.log
