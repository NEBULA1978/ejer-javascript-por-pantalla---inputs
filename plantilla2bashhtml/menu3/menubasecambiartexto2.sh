#!/bin/bash

# Define default values for variables
titulo="Título del texto"
parrafo="Este es un párrafo de ejemplo."
palabra="ejemplo"

# Function to set user-defined values for variables
set_variables() {
    read -r -p "Introduce el título del texto: " titulo
    read -r -p "Introduce el párrafo del texto: " parrafo
    read -r -p "Introduce la palabra que deseas cambiar en el párrafo: " palabra
}

# Menu for user choice
echo "1. Modificar variables"
echo "2. Usar valores por defecto"
read -r -p "Selecciona una opción (1/2): " choice

case "$choice" in
    1)
        set_variables ;;
    2)
        echo "Usando valores por defecto." ;;
    *)
        echo "Opción no válida. Usando valores por defecto." ;;
esac

# Generate the text with variables
texto="$titulo\n\n$parrafo"

# Replace the specified word in the paragraph
read -r -p "Introduce la palabra con la que deseas reemplazar '$palabra': " nueva_palabra
texto_modificado="${texto//${palabra}/$nueva_palabra}"

# Print the modified text
echo -e "$texto_modificado"

# Save the modified text to a file
read -r -p "¿Deseas guardar el texto modificado en un archivo? (Sí/No): " guardar

if [ "$guardar" == "Sí" ]; then
    read -r -p "Introduce el nombre del archivo: " nombre_archivo
    echo -e "$texto_modificado" > "$nombre_archivo"
    echo "Texto modificado guardado en '$nombre_archivo'."
fi

# versión modificada del script "menubasecambiartexto.sh" que te permitirá crear un archivo con las palabras por defecto y te preguntará qué palabra deseas cambiar:
# Este script te permitirá ingresar una nueva palabra para reemplazar la palabra por defecto en el párrafo. Además, te preguntará si deseas guardar el texto modificado en un archivo y te pedirá un nombre para ese archivo.
