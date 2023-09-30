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
