import SwiftUI

struct IPhoneDetailsView: View {
    let phone: Product
    @Environment(CartManager.self) private var cartManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(phone.imageName)
                Text(phone.name)
                    .scaledToFit()
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,50)
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
                    print("Предмет \(phone.name) Добавлен в корзину")
                    addToBasket(phone)
                }){
                    Text("Добавить в корзину")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.large)

            }
            .padding()
        }
        .navigationTitle(phone.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    func addToBasket(_ item: Product){
        cartManager.items.append(item)
        print("Предмет \(item.name) добавлен в корзину. Всего: \(cartManager.items.count)")
    }
}

