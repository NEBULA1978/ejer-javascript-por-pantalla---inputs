// vemos objeto object document window es el padre de todos
// console.log(document);
// alert("hola");


// seletor por id solo un elemento
// console.log(document.getElementById("cabecera"));

// sino existe el id sale null
// console.log(document.getElementById("meloinvento"));


// selector por clase: 
// me devuelve html collection length 0
console.log(document.getElementsByClassName("meloinvento"));

// me devuelve no  un array un listado con todos los elementos de esa clase
console.log(document.getElementsByClassName("border-grey"));

// seleccion por tagname
// aunque haya un elemento te devuelve un listado con un elemento
// si hay mas elementos nos devuelve un listado conn los elementos
// el unico selecor que devuelve un elemento null es getelementbyid
console.log(document.getElementsByTagName("li"));


// selector por propiedad nombre o propiedad name
// este selector lo que me va a permitir es filtrar por las etiquetas cuya propiedad name tenga un valor,
// name si se puede repetir no como los ids
console.log(document.getElementsByName("cabecera"));
// me da NodeList un listadode elementos

// query selector para seleccionar etiquetas css evez de anteriores este:

// de forma individual la 1º etiqueta que encuentre de arriba a abajo
console.log(document.querySelector("li"));

// seleccionar de forma lisatada, selecciona los elementos de etiqueta "li",
// nos devuelve listado  de 3elementos dentro
// de arriba a abajo mira
console.log(document.querySelectorAll("li"));

// queryselcetorAll seleciono etiquetaspor clases con el punto
console.log(document.querySelectorAll(".border-grey"));

// seleccionar por queryselcetorAll 
// console.log(document.querySelectorAll("#header"));
// console.log(document.querySelector("#header"));



// seleccionar por queryselcetorAll  por name puedo poner varios como selecion por clases de CSS
console.log(document.querySelector("[name=cabecera]"));