#!/bin/bash

# Peticion https descargamos pagina a archivo
curl https://www.vulnhub.com/ >log.log 2>/dev/null

echo "Estas son las maquinas disponibles: "

cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/ /' | awk '{print $3}' | tr -d '/' | sed 's/dowload/ /' | sed 's/"/ /' | tr -d '>' | tr -d ' ' | uniq

# Buscamos si se encuentra esta maquina dentro del archivo log.log descargado:
# Si añaden una nueva y pasa a la segunda pagina  no la detrecta y nos dice hay maquina nueva!!! 
cat log.log | grep noob >/dev/null

# Evaluamos que el comando anterior se ejecuto correctamente con $?
if [ "$(echo $?)" == "0" ]; then
  echo "No se encuentra ninguna maquina nueva"
else
  echo "Hay maquina nueva!!!"

fi

# No queremos tener basura
rm log.log