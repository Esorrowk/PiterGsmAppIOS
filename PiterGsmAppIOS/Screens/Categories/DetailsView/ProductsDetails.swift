import SwiftUI

struct ProductsDetailsView: View {
    let product: Product

    @State private var showAddToBasket: Bool = false
    @Environment(CartManager.self) private var cartManager

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Карточка продукта
                VStack(alignment: .leading, spacing: 16) {
                    Image(product.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                    
                    Text(product.name)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .italic()
                        .multilineTextAlignment(.leading)
                    
                    Text("\(product.price) ₽")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white) // Белый фон карточки
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1) // Серая рамка
                )
                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                // Кнопка добавить в корзину
                Button(action: {
                    addToBasket(product)
                    showAddToBasket = true
                }) {
                    Text("Добавить в корзину")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.large)
            }
            .padding()
        }
        .background(Color(.systemGray6)) // Светлый фон экрана
        .sheet(isPresented: $showAddToBasket) {
            VStack(spacing: 12) {
                Image(systemName: "checkmark")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.green)
                
                Text("Добавлено в корзину")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .presentationDetents([.height(120)])
            .presentationDragIndicator(.hidden)
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func addToBasket(_ item: Product) {
        cartManager.items.append(item)
        print("Предмет \(item.name) добавлен в корзину. Всего в корзине: \(cartManager.items.count)")
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
