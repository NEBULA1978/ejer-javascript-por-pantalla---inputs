#!/bin/bash

# Define la ruta completa donde deseas crear los archivos
ruta="/home/next/Escritorio/javascript-pantalla-css-ai/ejer javascript por pantalla - reechos/inputs"

# Cambia al directorio deseado
cd $ruta

# Utiliza un bucle para crear los archivos del 5 al 15 dentro de la carpeta "inputs"
for i in {5..15}
do
  touch "inputs/input$i.html"
done

# Confirma que se han creado los archivos
ls inputs
