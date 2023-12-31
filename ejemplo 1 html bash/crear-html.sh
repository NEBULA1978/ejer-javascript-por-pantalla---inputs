#!/bin/bash

# Nombre del archivo de salida
output_file="comparar_numeros.html"

# Contenido del archivo HTML
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
    <input type="number" id="numero1" min="1">

    <label>Introduce el segundo número:</label>
    <input type="number" id="numero2" min="1">

    <button id="botonComprobar" onclick="compararNumeros()">Comparar números</button>

    <p id="resultado"></p>

    <script>
      function compararNumeros() {
        var numero1Elemento = document.getElementById("numero1");
        var numero2Elemento = document.getElementById("numero2");
        var numero1 = parseInt(numero1Elemento.value);
        var numero2 = parseInt(numero2Elemento.value);
        var resultadoElemento = document.getElementById("resultado");

        // Validar que los números son válidos
        if (isNaN(numero1) || isNaN(numero2) || numero1 <= 0 || numero2 <= 0) {
          resultadoElemento.textContent = "Introduce números válidos";
          return;
        }

        if (numero1 == numero2) {
          resultadoElemento.textContent = "LOS NUMEROS SON IGUALES";
        } else if (numero1 > numero2) {
          resultadoElemento.textContent =
            "EL NUMERO MAYOR ES: " + numero1 + " EL NUMERO MENOR ES: " + numero2;
        } else {
          resultadoElemento.textContent =
            "EL NUMERO MAYOR ES: " + numero2 + " EL NUMERO MENOR ES: " + numero1;
        }

        // Borrar los valores de los inputs
        numero1Elemento.value = "";
        numero2Elemento.value = "";

        // Enfocar en el primer input
        numero1Elemento.focus();
      }
    </script>
  </body>
</html>
'

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Se ha creado el archivo $output_file con éxito."
