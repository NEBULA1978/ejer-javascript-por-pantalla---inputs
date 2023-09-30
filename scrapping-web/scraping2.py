import requests
from bs4 import BeautifulSoup

def get_price(url):
    try:
        html_text = requests.get(url).text
        soup = BeautifulSoup(html_text, 'html.parser')
        price_element = soup.find("span", {'class': "tvcurrent-price"})
        
        if price_element:
            price_with_eur = price_element.contents[0]
            return price_with_eur.strip()  # Eliminar espacios en blanco alrededor del precio
        else:
            return "Price not found on this page."
    except Exception as e:
        return f"Error: {e}"

# Lista de URLs que deseas procesar
urls = [
    "https://piensoymascotas.com/producto1",
    "https://piensoymascotas.com/producto2",
    # Agrega más URLs aquí
]

# Nombre del archivo en el que se guardarán los precios
output_file = "precios.txt"

# Abrir el archivo para escritura
with open(output_file, "w", encoding="utf-8") as file:
    for url in urls:
        price = get_price(url)
        file.write(f"{url}: {price}\n")
        print(f"Precio de {url}: {price}")

print("Los precios se han guardado en el archivo 'precios.txt'")

# Es un script de Python que se utiliza para obtener los precios de una lista de URLs y guardar esos precios en un archivo de texto llamado "precios.txt". A continuación, proporcionaré una descripción detallada del código y algunos apuntes adicionales:
# Descripción del código:

# Importar bibliotecas: El código comienza importando las bibliotecas necesarias: requests para realizar solicitudes HTTP y BeautifulSoup para analizar el HTML de las páginas web.

# Función get_price: Se define una función llamada get_price que toma una URL como entrada y devuelve el precio del producto si se encuentra en la página web. La función realiza lo siguiente:
#     Realiza una solicitud HTTP a la URL proporcionada para obtener el contenido HTML de la página.
#     Utiliza BeautifulSoup para analizar el HTML en busca de un elemento <span> con la clase "tvcurrent-price".
#     Si encuentra dicho elemento, extrae el contenido (precio) y lo devuelve después de eliminar los espacios en blanco alrededor.
#     Si no se encuentra el elemento, devuelve un mensaje indicando que el precio no se encontró en la página.

# Lista de URLs: Se define una lista llamada urls que contiene las URLs de los productos que se desean verificar. Puedes agregar más URLs a esta lista según tus necesidades.

# Archivo de salida: Se especifica el nombre del archivo en el que se guardarán los precios, que es "precios.txt".

# Procesamiento de URLs y escritura en el archivo: El código recorre cada URL en la lista urls. Para cada URL, llama a la función get_price para obtener el precio y luego escribe la URL y el precio en el archivo "precios.txt". También imprime el precio en la consola.

# Finalización del proceso: Después de procesar todas las URLs, se muestra un mensaje en la consola indicando que los precios se han guardado en el archivo "precios.txt".

# Apuntes adicionales:

# Se utiliza un bloque try...except para manejar excepciones. Si ocurre algún error al realizar la solicitud HTTP o al analizar el HTML, se captura la excepción y se muestra un mensaje de error en lugar de detener el programa.

# El código guarda los precios en un archivo de texto, uno por línea, en el formato "URL: Precio". Esto facilita la posterior lectura y análisis de los datos.

# Asegúrate de reemplazar las URLs de ejemplo en la lista urls con las URLs reales que deseas verificar.

# El código utiliza el método .strip() para eliminar espacios en blanco alrededor del precio. Esto garantiza que los precios estén limpios y formateados correctamente en el archivo de salida.

# Para ejecutar el código, simplemente cópialo y pégalo en un archivo Python (.py) y luego ejecuta ese archivo en tu entorno Python.

# Asegúrate de tener las bibliotecas requests y BeautifulSoup instaladas antes de ejecutar el código. Puedes instalarlas usando pip si aún no están instaladas.