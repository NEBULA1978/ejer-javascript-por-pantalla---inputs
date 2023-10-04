#!/bin/bash

# Solicitar nombres al usuario
read -p "Introduce el primer nombre: " nombre1
read -p "Introduce el segundo nombre: " nombre2

# Nombre del archivo de salida
output_file="nombres.html"

# Contenido del archivo HTML
html_content='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nombres</title>
  </head>
  <body>
    <p>Primer nombre: '$nombre1'</p>
    <p>Segundo nombre: '$nombre2'</p>
  </body>
</html>
'

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Se ha creado el archivo $output_file con éxito."
