import SwiftUI
// профиль
struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Профиль")
                    .font(.title2)
                    .padding()
                    .glassEffect()
                Spacer()
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
