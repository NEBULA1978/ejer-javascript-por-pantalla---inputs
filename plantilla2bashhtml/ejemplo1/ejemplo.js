// Acceso al documento y selección de un elemento por su ID
console.log(document.getElementById("cabecera"));

// Si no existe el ID, devuelve null
console.log(document.getElementById("meloinvento"));

// Selección de elementos por su clase (devuelve una colección HTML)
console.log(document.getElementsByClassName("meloinvento"));

// Selección de elementos por su clase (devuelve una colección de elementos)
console.log(document.getElementsByClassName("border-grey"));

// Selección de elementos por su etiqueta
console.log(document.getElementsByTagName("li"));

// Selección de elementos por su nombre (generalmente no se usa para elementos HTML)
console.log(document.getElementsByName("cabecera"));

// Utilización de querySelector para seleccionar elementos CSS (primer elemento)
console.log(document.querySelector("li"));

// Utilización de querySelectorAll para seleccionar elementos CSS (todos los elementos)
console.log(document.querySelectorAll("li"));
console.log(document.querySelectorAll(".border-grey"));

// Selección de elementos por su ID usando querySelector
console.log(document.querySelectorAll("#header"));
console.log(document.querySelector("#header"));

// Selección de elementos por su nombre de atributo
console.log(document.querySelector("[name=cabecera]"));

// Acceso a propiedades del elemento y relaciones entre elementos
const elemento = document.getElementById("header");
console.log(elemento.children); // Elementos hijos
console.log(document.children); // Elementos hijos del documento
console.log(elemento.parentElement); // Elemento padre del elemento
console.log(document.parentElement); // El documento no tiene un elemento padre

// Selección de elementos por clase y creación de variables para listas
const lista1 = document.getElementsByClassName("border-grey");
const lista2 = document.querySelectorAll(".border-grey");

// Creación de elementos y comentarios en JavaScript
const titulo2 = document.createElement('h2'); // Crear un elemento <h2>
const textotitulo2 = document.createTextNode("Nuevo titulo para el video"); // Crear un texto
const comentario = document.createComment("Comentario random"); // Crear un comentario

// Selección de elementos por etiqueta usando querySelector
const articulo = document.querySelector('article');

// Clonación de elementos en la consola (en memoria)
// Usar articulo.cloneNode() crea una copia sin hijos
// Usar articulo.cloneNode(true) crea una copia con hijos
const articulo2 = articulo.cloneNode(true); // Crear una copia en memoria

// Comprobar si un elemento está conectado al DOM
console.log(articulo.isConnected); // Devuelve true si está conectado, false si no lo está

// Selección de un elemento por su ID
const section = document.getElementById("section");

// Agregar una copia de section al DOM como último hijo
section.appendChild(articulo2);

// Insertar elementos antes o después de otro elemento
section.insertAdjacentElement('beforebegin', articulo2); // Antes del elemento
section.insertAdjacentElement('beforeend', articulo2); // Después del elemento

// Agregar texto dentro de un elemento
section.insertAdjacentText('beforeend', 'Aqui acaba la sesion');

// Agregar elementos HTML dentro de un elemento
section.insertAdjacentHTML('beforeend', '<h3>Esto es un titulo inventado</h3>');

// Eliminar un nodo del DOM
section.remove();

// Reemplazar el contenido de una etiqueta
section.innerHTML = '<h2>Nuevo titulo de la sección</h2>';

// Obtener el nombre de cualquier etiqueta que contenga un atributo específico
console.log(section.getAttribute('id')); // Devuelve 'section'

// Atajo para obtener el ID de un elemento
console.log(section.id); // Devuelve 'section'

// Obtener el valor de un atributo específico
console.log(section.getAttribute('nombre')); // Devuelve 'meloinvento'

// Cambiar el valor de un atributo
section.setAttribute('nombre', 'otrovalor');

// Otra forma de obtener el valor de la clase
console.log(section.getAttribute('class')); // No da 'border-grey'

// Ver las clases de un elemento
console.log(section.classList);

// Obtener el valor de la clase como cadena de texto
console.log(section.className); // Devuelve la cadena de clase

// Cambiar el nombre de la clase de un elemento
section.className += ' nuevaclaseCss';

// Agregar una nueva clase a un elemento
section.classList.add('nuevaclase');

// Eliminar una clase de un elemento
section.classList.remove('nuevaclase');

// Alternar una clase en un elemento (la quita si está presente, la agrega si no lo está)
section.classList.toggle('nuevayeaclase');
