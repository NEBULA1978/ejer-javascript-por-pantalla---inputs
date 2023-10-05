#!/bin/bash


# Peticion https
curl https://www.vulnhub.com/ > log.log  2>/dev/null

echo "Estas son las maquinas disponibles: "

cat log.log | grep 'href="/entry/' | 
tr -d '#' | sed 's/entry/ /' | awk '{print $3}' | tr -d '/' | sed 's/dowload/ /'