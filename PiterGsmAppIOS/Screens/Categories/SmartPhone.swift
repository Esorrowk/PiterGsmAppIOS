import SwiftUI

struct SmartPhone: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let price: Double
}

struct SmartPhoneScreenView: View {
    
    // Список айфонов
    let smartPhones: [SmartPhone] = [
        SmartPhone(name: "iPhone 17", description: "Новый iPhone с суперкамерой", imageName: "iPhone17", price: 129999),
        SmartPhone(name: "iPhone 17 Pro", description: "Премиум версия", imageName: "iPhone17Pro", price: 149999),
        SmartPhone(name: "iPhone Air", description: "Лёгкий и стильный", imageName: "iPhoneAir", price: 109999),
        SmartPhone(name: "iPhone SE", description: "Бюджетная модель", imageName: "iPhoneSE", price: 69999)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(smartPhones) { phone in
                    SmartPhoneCardView(
                        productName: phone.name,
                        productDescription: phone.description,
                        productImageName: phone.imageName,
                        productPrice: phone.price
                    )
                }
            }
            .padding()
        }
        .navigationTitle("Smartphone")
    }
}

struct SmartPhoneCardView: View {
    
    let productName: String
    let productDescription: String
    let productImageName: String
    let productPrice: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(productImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(10)
            
            Text(productName)
                .font(.headline)
            
            Text(productDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("\(productPrice, specifier: "%.0f") ₽")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}




