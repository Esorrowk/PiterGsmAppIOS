import SwiftUI

struct IPadScreenView: View {
    @Environment(CartManager.self) private var cartManager

    let ipades: [Product] = [
        Product(name: "Apple iPad (2021)", description: "Планшет Apple iPad (2021) 64Gb Wi-Fi, серый космос", imageName: "IPad2021", price: 20_790),
        Product(name: "Apple iPad (2022)", description: "Планшет Apple iPad (2022) Wi-Fi 64Gb, синий", imageName: "IPad2022", price: 27_190),
        Product(name: "Apple iPad mini (2024)", description: "Планшет Apple iPad mini (2024) 128Gb Wi-Fi, серый космос", imageName: "IPadMini", price: 39_290),
        Product(name: "Apple iPad Pro 13 M5 (2025)", description: "Планшет Apple iPad Pro 13 M5 (2025) 2Tb Wi‑Fi + Cellular, нанотекстурное стекло, серый космос (Space Black)", imageName: "IPadPro", price: 203_490)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(ipades) { ipad in
                        NavigationLink {
                            // Экран деталей для конкретного продукта
                            ProductsDetailsView(product: ipad)
                        } label: {
                            ProductCardView(product: ipad)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("iPad")
        }
    }
}

