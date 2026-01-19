import SwiftUI

struct IPhoneDetailsView: View {
    let phone: Product

    @State private var showAddToBasket: Bool = false
    @Environment(CartManager.self) private var cartManager
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(phone.imageName)
                Text(phone.name)
                    .scaledToFit()
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 50)
                Text(phone.description)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .italic()
                    .padding(.leading, 50)
                Text("\(phone.price) ₽")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 50)
                Button(action: {
                    print("Предмет \(phone.name) добавлен в корзину")
                    addToBasket(phone)
                    showAddToBasket = true
                }) {
                    Text("Добавить в корзину")
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.large)
            }
            .padding()
        }
        // всплывающее окно
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
        .navigationTitle(phone.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    func addToBasket(_ item: Product) {
        cartManager.items.append(item)
        print("Предмет \(item.name) добавлен в корзину. Всего: \(cartManager.items.count)")
    }
}
