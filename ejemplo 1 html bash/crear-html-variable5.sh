#!/bin/bash

# Solicitar nombres de variables al usuario
read -r -p "Introduce el nombre de la segunda variable (por ejemplo, var2): " variable2
read -r -p "Introduce el nombre de la primera variable (por ejemplo, var1): " variable1
read -r -p "Introduce el nombre de getElementById (por ejemplo, getElementById): " getElementById
read -r -p "Introduce el nombre de la variable para el resultado (por ejemplo, resultadoElemento): " resultadoVariable
read -r -p "Introduce el nombre de la variable para el resultado parseado (por ejemplo, resultadoParseado): " resultadoParseadoVariable

# Nombre del archivo de salida
output_file="comparar_numeros.html"

# Contenido del archivo HTML con los nombres de variables
html_content='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
    <label>Introduce el primer número:</label>
    <input type="number" id="'$variable1'" min="1">

    <label>Introduce el segundo número:</label>
    <input type="number" id="'$variable2'" min="1">

    <button id="botonComprobar" onclick="compararNumeros()">Comparar números</button>

    <p id="'$resultadoVariable'"></p>

    <script>
    
      function compararNumeros() {
        var '$variable1' = document.'$getElementById'("'$variable1'");
        var '$variable2' = document.'$getElementById'("'$variable2'");
        var numero1 = parseInt('$variable1'.value);
        var numero2 = parseInt('$variable2'.value);
        var '$resultadoParseadoVariable' = parseInt('$resultadoVariable'.textContent);

        // Validar que los números son válidos
        if (isNaN(numero1) || isNaN(numero2) || numero1 <= 0 || numero2 <= 0) {
          '$resultadoVariable'.textContent = "Introduce números válidos";
          return;
        }

        if (numero1 == numero2) {
          '$resultadoVariable'.textContent = "LOS NUMEROS SON IGUALES";
        } else if (numero1 > numero2) {
          '$resultadoVariable'.textContent =
            "EL NUMERO MAYOR ES: " + numero1 + " EL NUMERO MENOR ES: " + numero2;
        } else {
          '$resultadoVariable'.textContent =
            "EL NUMERO MAYOR ES: " + numero2 + " EL NUMERO MENOR ES: " + numero1;
        }

        // Borrar los valores de los inputs
        '$variable1'.value = "";
        '$variable2'.value = "";

        // Enfocar en el primer input
        '$variable1'.focus();
      }
    </script>
  </body>
</html>
'

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Se ha creado el archivo $output_file con éxito."
