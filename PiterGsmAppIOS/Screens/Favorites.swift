import SwiftUI

// избранное
struct FavoritesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Избранное")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Избранное")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
