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
    response = requests.get(url, headers=HEADERS, timeout=10)
    if response.status_code != 200:
        print(f'Ошибка при получении страницы {url}: {response.status_code}')
        continue

    print(f'Парсим страницу: {url}')
    soup = BeautifulSoup(response.text, "html.parser")

    # На каждой странице ищем товары
    items = soup.select("li.hcatsublist__item")

    for item in items:
        link_tag = item.select_one("a.hcatsublist__link")
        img_tag = item.select_one("img.hcatsublist__pic-img")

        if not link_tag or not img_tag:
            continue

        # Ссылка и картинка
        link = HOME_URL + link_tag["href"]
        img = HOME_URL + img_tag["src"]

        # Заходим на страницу товара для полного названия и цены
        try:
            product_resp = requests.get(link, headers=HEADERS, timeout=10)
            product_soup = BeautifulSoup(product_resp.text, "html.parser")

            # Полное название
            full_name_tag = product_soup.select_one("a.prodcard__name") or product_soup.select_one("h1.prodcard__name")
            name = full_name_tag.text.strip() if full_name_tag else "Нет названия"

            # Цена
            price_tag = product_soup.select_one("div.prodcard__price span") or product_soup.select_one("div.prodcard__price")
            price = price_tag.text.strip() if price_tag else "Цена не указана"

        except Exception as e:
            print(f"Ошибка при получении данных товара {link}: {e}")
            name = "Нет названия"
            price = "Цена не указана"

        products.append({
            "name": name,
            "url": link,
            "image": img,
            "price": price
        })

# Сохраняем в JSON
with open("products.json", "w", encoding="utf-8") as f:
    json.dump(products, f, ensure_ascii=False, indent=2)

print(f"Сохранено {len(products)} товаров")