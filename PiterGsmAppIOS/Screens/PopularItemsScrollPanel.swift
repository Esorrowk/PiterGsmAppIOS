import SwiftUI

struct PopularItemsScrollPanel: View{
    struct PopularItemsScroll: Identifiable{
        let id = UUID()
        let imageName: String
        let itemName: String
        let price: Int
    }
    let popularItems: [PopularItemsScroll] = [
        PopularItemsScroll(imageName: "AirPodsPro2", itemName: "Беспроводные наушники Apple AirPods 2 (2023) MagSafe Charging Cast (USB-C) MTJV3", price: 16_990),
        PopularItemsScroll(imageName: "Playstation5", itemName: "Игровая приставка Sony Playstation 5 Pro Digital Edition", price: 72_490),
        PopularItemsScroll(imageName: "NintendoSwitch", itemName: "Игровая приставка Nintendo Switch 2 256 Гб, черный", price: 54_990),
        PopularItemsScroll(imageName: "Playstation5Slim", itemName: "Игровая приставка Sony PlayStation 5 Slim Digital Edition", price: 43_390),
        PopularItemsScroll(imageName: "Iphone17eSim", itemName: "Смартфон Apple Iphone 17 eSim 256GB,Lavender(Фиолетовый)", price: 73_990),
        PopularItemsScroll(imageName: "YandexAlisa", itemName: "Умная портативная колонка Яндекс Станция Стрит с Алисой,фиолетовый", price:9_690),
        PopularItemsScroll(imageName: "DysonAirstrait", itemName: "Выпрямитель Dyson Airstrait HT01, Kanzan Pink (599523-01) Exclusive New", price: 35_990),
        PopularItemsScroll(imageName: "DysonAirwrap", itemName: "тайлер yson Airwrap Co-Anda 2x HS09, Ceramic Pink", price:64_990),
        PopularItemsScroll(imageName: "SonyWh", itemName: "Беспроводные наушники Sony WH-100XM6, серебристый", price: 32_490),
        PopularItemsScroll(imageName: "Fujifilm", itemName: "Фотоаппарат моментальной печати Fujifilm Instax Mini 12,Pastel Blue", price: 10_390),
        PopularItemsScroll(imageName: "Ipad2025", itemName: "Планшет pple Ipad (2025) Wi-Fi 128Gb, серебристый", price:35_490),
        PopularItemsScroll(imageName: "DysonAirstraitHT01", itemName: "Выпрямитель yson Airstrait HT01, никель/ьудь (388412)", price: 36_990),
        PopularItemsScroll(imageName: "DysonV15s", itemName: "Пылесос yson V15s Detect Submarine (SV47),yellow/nikel", price:65_990)
    ]
    // текущая картинка
    @State private var currentIndex = 0
    
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(popularItems){ item in
                    VStack(alignment:.leading, spacing: 8){
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(10)
                        Text(item.itemName)
                            .font(.caption)
                            .lineLimit(2)
                        Text("\(item.price) ₽")
                            .font(.headline)
                    }
                    .padding()
                    .frame(width: 300)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    
                }
            }
            
        }
    }
}
