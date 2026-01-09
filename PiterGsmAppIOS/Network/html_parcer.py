import requests
import json
from bs4 import BeautifulSoup

HOME_URL = 'https://pitergsm.ru'

urls = [
    f'{HOME_URL}/catalog/phones/iphone/',
    f'{HOME_URL}/catalog/mac/',
    f'{HOME_URL}/catalog/tablets/ipad/',
    f'{HOME_URL}/catalog/audio/',
    f'{HOME_URL}/catalog/watch/',
    f'{HOME_URL}/catalog/phones/',
    f'{HOME_URL}/catalog/tablets/',
    f'{HOME_URL}/catalog/laptops/',
    f'{HOME_URL}/catalog/accessories/'
]

HEADERS = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X)"}

products = []

for url in urls:
    response = requests.get(url, headers=HEADERS)
    if response.status_code != 200:
        print(f'Ошибка при получении страницы {url}: {response.status_code}')
        continue

    print(f'Парсим страницу: {url}')
    soup = BeautifulSoup(response.text, "html.parser")

    # На каждой странице ищем товары в li.hcatsublist__item
    items = soup.select("li.hcatsublist__item")

    for item in items:
        name_tag = item.select_one("span.hcatsublist__text")
        link_tag = item.select_one("a.hcatsublist__link")
        img_tag = item.select_one("img.hcatsublist__pic-img")
        price_tag = item.select_one("div.prodcard__price span")

        if not name_tag or not link_tag or not img_tag:
            continue

        name = name_tag.text.strip()
        link = HOME_URL + link_tag["href"]
        img = HOME_URL + img_tag["src"]
        price = price_tag.text.strip() if price_tag else "Цена не указана"

        products.append({
            "name": name,
            "url": link,
            "image": img,
            "price": price
        })

with open("products.json", "w", encoding="utf-8") as f:
    json.dump(products, f, ensure_ascii=False, indent=2)

print(f"Сохранено {len(products)} товаров")