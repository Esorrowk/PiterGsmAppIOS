import SwiftUI
// каталог
struct CatalogView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Каталог")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Каталог")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
