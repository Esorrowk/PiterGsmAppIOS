import SwiftUI

// модель данных


struct IPhone: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let price: Double
}

struct IPhoneScreenView: View {
    
    // Список айфонов
    let iphones: [IPhone] = [
        IPhone(name: "iPhone 17", description: "Новый iPhone с суперкамерой", imageName: "Iphone17", price: 129_999),
        IPhone(name: "iPhone 17 Pro", description: "Премиум версия", imageName: "Iphone17Pro", price: 149_999),
        IPhone(name: "iPhone Air", description: "Лёгкий и стильный", imageName: "IphoneAir", price: 109_999),
        IPhone(name: "iPhone SE", description: "Бюджетная модель", imageName: "IphoneSE", price: 24_990)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(iphones) { phone in
                    IPhoneCardView(
                        productName: phone.name,
                        productDescription: phone.description,
                        productImageName: phone.imageName,
                        productPrice: phone.price
                    )
                }
            }
            .padding()
        }
        .navigationTitle("iPhone")
    }
}

struct IPhoneCardView: View {
    
    let productName: String
    let productDescription: String
    let productImageName: String
    let productPrice: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Картинка сверху
            Image(productImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
            
            // Название продукта
            Text(productName)
                .font(.headline)
                .bold()
                .lineLimit(2)
            
            // Цена
            Text("\(Int(productPrice)) ₽")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
