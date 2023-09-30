'use strict'

/*
Utilizando un bucle, mostrar la suma y la media de los numeros introducidos
hasta introducir un numero negativo y ahí mostrar el resultado
*/

var suma = 0;
var contador = 0;

do {
    var numero = parseInt(prompt('Introduce numeros hasta que metas uno negativo', 0));

    if (isNaN(numero)) {
        numero = 0;

    } else if (numero >= 0) {
        suma = suma + numero;
        // suma += numero;

        contador++;
    }

    document.write(suma + "<br/>");
    document.write(contador + "<br/>");

} while (numero >= 0)

document.write(" La suma de todos los numeros es: " + suma + "<br/>");

document.write(" La media de todos los numeros es: " + (suma / contador));