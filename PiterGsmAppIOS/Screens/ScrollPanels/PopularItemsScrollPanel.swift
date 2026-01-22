import SwiftUI

struct PopularItemsScrollPanel: View {
    // Полный список популярных товаров
    let popularItems: [Product] = [
        Product(name: "AirPods Pro 2", description: "Беспроводные наушники Apple AirPods 2 (2023) MagSafe Charging Cast (USB-C) MTJV3", imageName: "AirPodsPro2", price: 16_990),
        Product(name: "Playstation 5 Pro", description: "Игровая приставка Sony Playstation 5 Pro Digital Edition", imageName: "Playstation5", price: 72_490),
        Product(name: "Nintendo Switch 2", description: "Игровая приставка Nintendo Switch 2 256 Гб, черный", imageName: "NintendoSwitch", price: 54_990),
        Product(name: "Playstation 5 Slim", description: "Игровая приставка Sony PlayStation 5 Slim Digital Edition", imageName: "Playstation5Slim", price: 43_390),
        Product(name: "iPhone 17 eSim", description: "Смартфон Apple iPhone 17 eSim 256GB, Lavender (Фиолетовый)", imageName: "Iphone17eSim", price: 73_990),
        Product(name: "Yandex Alisa", description: "Умная портативная колонка Яндекс Станция Стрит с Алисой, фиолетовый", imageName: "YandexAlisa", price: 9_690),
        Product(name: "Dyson Airstrait", description: "Выпрямитель Dyson Airstrait HT01, Kanzan Pink (599523-01) Exclusive New", imageName: "DysonAirstrait", price: 35_990),
        Product(name: "Dyson Airwrap", description: "Тайлер Dyson Airwrap Co-Anda 2x HS09, Ceramic Pink", imageName: "DysonAirwrap", price: 64_990),
        Product(name: "Sony WH-100XM6", description: "Беспроводные наушники Sony WH-100XM6, серебристый", imageName: "SonyWh", price: 32_490),
        Product(name: "Fujifilm Instax Mini 12", description: "Фотоаппарат моментальной печати Fujifilm Instax Mini 12, Pastel Blue", imageName: "Fujifilm", price: 10_390),
        Product(name: "iPad 2025 Wi-Fi 128Gb", description: "Планшет Apple iPad (2025) Wi-Fi 128Gb, серебристый", imageName: "Ipad2025", price: 35_490),
        Product(name: "Dyson Airstrait HT01", description: "Выпрямитель Dyson Airstrait HT01, никель/чёрный (388412)", imageName: "DysonAirstraitHT01", price: 36_990),
        Product(name: "Dyson V15s", description: "Пылесос Dyson V15s Detect Submarine (SV47), yellow/nikel", imageName: "DysonV15s", price: 65_990)
    ]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(popularItems) { item in
                    NavigationLink {
                        ProductsDetailsView(product: item)
                    } label: {
                        VStack(alignment:.leading, spacing: 8){
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(12)
                            
                            Text(item.name)
                                .font(.headline)
                                .lineLimit(2)
                            
                            Text("\(item.price) ₽")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 270)
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 320)
        .background(Color(.systemGray6))
    }
}
