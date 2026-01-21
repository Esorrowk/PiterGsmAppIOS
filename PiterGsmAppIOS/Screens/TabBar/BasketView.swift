import SwiftUI

// корзина
struct BasketView: View {
    @Environment(CartManager.self) private var cartManager
    var body: some View {
        NavigationStack {
            VStack {
                if cartManager.items.isEmpty{
                    ContentUnavailableView("Корзина пуста", systemImage: "cart")
                }else{
                    List{
                        ForEach(cartManager.items){ item in
                            HStack(){
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                    Button(role: .destructive) {
                                        print("\(item.name) удален из корзины")
                                        cartManager.removeToCart(product: item)
                                    } label: {
                                        Label("Удалить", systemImage: "trash")
                                    }
                                }
                                Text("\(item.price) ₽")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                }
                if !cartManager.items.isEmpty{
                    Button("Оформить заказ"){
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .controlSize(.large)
                }
            }
            .navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    // Вынесли функцию из тела body
    private func deleteItems(at offsets: IndexSet) {
        cartManager.items.remove(atOffsets: offsets)
    }
}
