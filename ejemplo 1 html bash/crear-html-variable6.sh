#!/bin/bash

# Solicitar nombres de etiquetas y variables al usuario
read -r -p "Introduce el nombre para la etiqueta de la primera entrada (por ejemplo, etiqueta1): " etiqueta1
read -r -p "Introduce el nombre para la etiqueta de la segunda entrada (por ejemplo, etiqueta2): " etiqueta2
read -r -p "Introduce el nombre para el botón (por ejemplo, boton): " boton
read -r -p "Introduce el nombre para el párrafo de resultado (por ejemplo, resultadoParrafo): " resultadoParrafo
read -r -p "Introduce el nombre para la función JavaScript (por ejemplo, compararNumeros): " funcionJS
read -r -p "Introduce el nombre para el variable del primer número (por ejemplo, numero1): " numero1
read -r -p "Introduce el nombre para el variable del segundo número (por ejemplo, numero2): " numero2
read -r -p "Introduce el nombre para el variable del resultado parseado (por ejemplo, resultadoParseado): " resultadoParseado
read -r -p "Introduce el nombre para el variable del resultado (por ejemplo, resultado): " resultado

# Nombre del archivo de salida
output_file="comparar_numeros.html"

# Contenido del archivo HTML con los nombres personalizados
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
    <input type="number" id="'$etiqueta1'" min="1">

    <label>Introduce el segundo número:</label>
    <input type="number" id="'$etiqueta2'" min="1">

    <button id="'$boton'" onclick="'$funcionJS'()">Comparar números</button>

    <p id="'$resultadoParrafo'"></p>

    <script>
    
      function '$funcionJS'() {
        var '$numero1' = document.getElementById('$etiqueta1');
        var '$numero2' = document.getElementById('$etiqueta2');
        var '$resultadoParseado' = parseInt('$numero1'.value);
        var '$resultado' = parseInt('$numero2'.value);

        // Validar que los números son válidos
        if (isNaN('$resultadoParseado') || isNaN('$resultado') || '$resultadoParseado' <= 0 || '$resultado' <= 0) {
          document.getElementById('$resultadoParrafo').textContent = "Introduce números válidos";
          return;
        }

        if ('$resultadoParseado' == '$resultado') {
          document.getElementById('$resultadoParrafo').textContent = "LOS NUMEROS SON IGUALES";
        } else if ('$resultadoParseado' > '$resultado') {
          document.getElementById('$resultadoParrafo').textContent =
            "EL NUMERO MAYOR ES: " + '$resultadoParseado' + " EL NUMERO MENOR ES: " + '$resultado';
        } else {
          document.getElementById('$resultadoParrafo').textContent =
            "EL NUMERO MAYOR ES: " + '$resultado' + " EL NUMERO MENOR ES: " + '$resultadoParseado';
        }

        // Borrar los valores de los inputs
        '$numero1'.value = "";
        '$numero2'.value = "";

        // Enfocar en el primer input
        '$etiqueta1'.focus();
      }
    </script>
  </body>
</html>
'

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Se ha creado el archivo $output_file con éxito."
