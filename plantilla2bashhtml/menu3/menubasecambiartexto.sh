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
texto_modificado="${texto//${palabra}/PalabraCambiada}"

# Print the modified text
echo -e "$texto_modificado"


# In this script:

# You define default values for titulo, parrafo, and palabra.
# The set_variables function allows the user to input new values for these variables.
# The user is presented with a menu to choose between modifying the variables or using defaults.
# After modifying the variables or using defaults, the script generates the text with the variables and replaces the specified word in the paragraph with "PalabraCambiada."
# You can customize this script further to suit your specific needs and add more variables or options as required.

# En este script:

# Se definen valores por defecto para titulo, parrafo y palabra.
# La función set_variables permite al usuario ingresar nuevos valores para estas variables.
# Se presenta al usuario un menú para elegir entre modificar las variables o usar los valores por defecto.
# Después de modificar las variables o usar los valores por defecto, el script genera el texto con las variables y reemplaza la palabra especificada en el párrafo por "PalabraCambiada".
# Puedes personalizar aún más este script para que se adapte a tus necesidades específicas y agregar más variables u opciones según sea necesario.