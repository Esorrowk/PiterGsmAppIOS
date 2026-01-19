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
                    List(cartManager.items) { item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text("\(item.price) ₽")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                            }
                        }

                    }
                    .listStyle(.plain)
                }
                if !cartManager.items.isEmpty{
                    Button("Оформить заказ"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
