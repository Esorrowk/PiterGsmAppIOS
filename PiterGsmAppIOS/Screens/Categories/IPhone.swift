import SwiftUI

// Модель данных
public struct Product: Identifiable, Equatable {
    public let id = UUID()
    public let name: String
    public let description: String
    public let imageName: String
    public let price: Int
}

// Экран iPhone
struct IPhoneScreenView: View {
    @Environment(CartManager.self) private var cartManager

    // Список айфонов
    let iphones: [Product] = [
        Product(name: "iPhone 17", description: "Новый iPhone с суперкамерой", imageName: "Iphone17", price: 129_999),
        Product(name: "iPhone 17 Pro", description: "Премиум версия", imageName: "Iphone17Pro", price: 149_999),
        Product(name: "iPhone Air", description: "Лёгкий и стильный", imageName: "IphoneAir", price: 109_999),
        Product(name: "iPhone SE", description: "Бюджетная модель", imageName: "IphoneSE", price: 24_990)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(iphones) { phone in
                        NavigationLink {
                            // Экран деталей для конкретного телефона
                            ProductsDetailsView(product: phone)
                        } label: {
                            ProductCardView(product: phone)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("iPhone")
        }
    }
}

// Универсальная карточка
struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
            
            Text(product.name)
                .font(.headline)
                .bold()
                .lineLimit(2)
            
            Text("\(product.price) ₽")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
