#!/bin/bash



# Nombre del archivo HTML descargado
html_file="webpage.html"

# Usar grep para buscar líneas que contengan precios en euros
# y guardarlas en un archivo temporal
grep -Eo '€[0-9]+\.[0-9]+' "$html_file" > precios.txt

# Usar sed para eliminar el símbolo de euro (€) y guardar el resultado en un archivo final
sed 's/€//g' precios.txt > precios_filtrados.txt

# Mostrar los precios filtrados
cat precios_filtrados.txt

# Eliminar archivos temporales
rm precios.txt
