#!/bin/bash

# Define default values for variables
id1header="header"
claseheader="border-grey"
namecabecera="cabecera"
navclass="border-grey"
idmain="main"
idsection="section"

# Function to set user-defined values for variables
set_variables() {
    read -r -p "Introduce el nombre del id de header (por ejemplo, header): " id1header
    read -r -p "Introduce el nombre del id de main (por ejemplo, main): " idmain
    read -r -p "Introduce el nombre del id de section (por ejemplo, section): " idsection
    read -r -p "Cambiar en header el nombre de la clase (por ejemplo, border-grey): " claseheader
    read -r -p "Cambiar en header el nombre del atributo name (por ejemplo, cabecera): " namecabecera
    read -r -p "Cambiar en nav el nombre de la clase del nav (por ejemplo, border-grey): " navclass
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

# Name of the file you want to create
archivo="mi_pagina.html"

# Contenido del archivo HTML with variables
html_content='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <!-- <script defer src="ejemplo.js"></script> -->
    <!-- <script src="ejemplo.js" async></script> -->
    <script defer src="ejemplo.js"></script>
    
    <title>Dom</title>
</head>
<body>
    <header id="'"$id1header"'" class="'"$claseheader"'" name="'"$namecabecera"'">
        <h1>Mi web/blog para trastear con el DOM</h1>
    </header>
    <nav class="'"$navclass"'">
        <ul>
            <li><a href="#">LINK 1</a></li>
            <li><a href="#">LINK 2</a></li>
            <li><a href="#">LINK 3</a></li>
        </ul>
    </nav>
    
    <main id="'"$idmain"'">
        <!-- beforebegin -->
        <section id="'"$idsection"'" class="border-grey" nombre="meloinvento">
            <!-- afeterbegin -->
            <h2>Titulo de la seccion</h2>
            <article class="border-grey">
                <h3>Titulo del articulo h3</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem.</p>
            </article>
            <!-- beforeend -->
        </section>
        <!-- afterend -->
    </main>
    <footer class="border-grey">
        <p>2022 Desarrollo útil</p>
    </footer>
</body>
</html>'

# Create the HTML file
echo "$html_content" > "$archivo"

# Confirmation message
echo "Archivo HTML '$archivo' creado con éxito."
