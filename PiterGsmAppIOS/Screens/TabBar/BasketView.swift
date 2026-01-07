import SwiftUI

// корзина
struct BasketView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Корзина")
                    .font(.title2)
                    .padding()
                    .glassEffect()
                Spacer()
            }
            .navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
