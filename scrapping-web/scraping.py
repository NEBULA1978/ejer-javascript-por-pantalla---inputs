import requests
from bs4 import BeautifulSoup

def get_price(url):
    html_text = requests.get(url).text
    soup = BeautifulSoup(html_text, 'html.parser')
    price_element = soup.find("span", {'class': "tvcurrent-price"})
    
    if price_element:
        price_with_eur = price_element.contents[0]
        return price_with_eur
    else:
        return "Price not found on this page."

while True:
    url = input('¿De qué producto quieres saber el precio? ')
    if url == '':
        break
    print(get_price(url))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números pares en la lista

def suma_pares(lista):
    suma = 0
    for i in lista:
        if i % 2 == 0:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_pares(lista))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números impares en la lista

def suma_impares(lista):
    suma = 0
    for i in lista:
        if i % 2!= 0:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_impares(lista))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números negativos en la lista

def suma_negativos(lista):
    suma = 0
    for i in lista:
        if i < 0:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_negativos(lista))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números positivos en la lista

def suma_positivos(lista):
    suma = 0
    for i in lista:
        if i > 0:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_positivos(lista))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números nulos en la lista

def suma_nulos(lista):
    suma = 0
    for i in lista:
        if i is None:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_nulos(lista))

# "Desarrolla una función en Python que tome una lista de números como entrada y devuelva la suma de todos los números negativos o nulos en la lista

def suma_negativos_o_nulos(lista):
    suma = 0
    for i in lista:
        if i is None or i < 0:
            suma += i
    return suma

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(suma_negativos_o_nulos(lista))
